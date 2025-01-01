import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_advanced/features/graph_metrics/presentation/views/widgets/orders_metric_card.dart';
import 'package:intl/intl.dart';
import 'package:flutter_advanced/core/utils/helper.dart';
import 'package:flutter_advanced/features/graph_metrics/domain/entities/order.dart';
import 'package:flutter_advanced/features/graph_metrics/domain/entities/order_graph_data.dart';
import 'package:flutter_advanced/features/graph_metrics/domain/usecases/fetch_orders_use_case.dart';
import 'package:flutter_advanced/features/graph_metrics/presentation/views/widgets/graph_filter_component.dart';
import 'package:flutter_advanced/features/graph_metrics/presentation/views/widgets/orders_graph_dropdown.dart';

part 'orders_status.dart';

class OrdersCubit extends Cubit<OrdersStatus> {
  final FetchOrdersUseCase fetchOrdersUseCase;

  static OrdersCubit get(context) => BlocProvider.of(context);
  OrdersCubit({required this.fetchOrdersUseCase}) : super(OrdersInitialState());

  final Map<MetricLabels, dynamic> metrics = {};
  List<OrderEntity> orders = [];
  MonthEnum selectedMonth = MonthEnum.values[DateTime.now().month - 1];
  GraphFilter graphFilter = GraphFilter.hours;

  Future<void> fetchAllOrders() async {
    emit(OrdersLoadingState());
    final result = await fetchOrdersUseCase.call();
    result.fold(
      (exp) {
        emit(OrdersFailureState(
          message: exp.toString(),
        ));
      },
      (orders) {
        emit(OrdersLoadedState(orders: this.orders = orders));
      },
    );
  }

  /// This function is used to calculate the metrics for all the orders
  /// take the ``list of orders`` and calculate the metrics
  void calculateMetrics(List<OrderEntity> orders) {
    final int totalCount = orders.length;
    final double averagePrice = orders.isNotEmpty
        ? orders.map((order) => order.price!).reduce((a, b) => a + b) /
            totalCount
        : 0.0;
    final int returnCount =
        orders.where((order) => order.status == OrderStatus.returned).length;

    metrics.addAll({
      MetricLabels.total: totalCount,
      MetricLabels.average: averagePrice.toStringAsFixed(2).priceToDouble(),
      MetricLabels.returns: returnCount,
    });
  }

  /// Function to aggregate orders by month and hours or days
  void aggregateOrdersByMonth() async {
    final Map<String, int> groupedData = {};
    int total = 0;
    int maxHrOrders = 0;
    int minHrOrders = double.maxFinite.toInt();
    final dateFormat =
        graphFilter == GraphFilter.hours ? DateFormat.Hm() : DateFormat.d();

    try {
      for (var order in orders) {
        if (order.registered == null) continue;
        if (order.registered!.month != selectedMonth.index + 1) continue;
        final dateKey = dateFormat.format(order.registered!);
        groupedData[dateKey] = (groupedData[dateKey] ?? 0) + 1;
        total++;
      }
      if (groupedData.isNotEmpty) {
        for (var count in groupedData.values) {
          if (count > maxHrOrders) maxHrOrders = count;
          if (count < minHrOrders) minHrOrders = count;
        }
      } else {
        minHrOrders = 0; // No orders in the data
      }
      final ordersGraphData = _fillGraphOrdersList(groupedData);
      sortGraphData(graphData: ordersGraphData, filter: graphFilter);
      emit(OrdersLoadGraphState(
        graphData: ordersGraphData,
        totalOrders: total,
        maxHourlyOrders: maxHrOrders,
        minHourlyOrders: minHrOrders,
      ));
    } catch (e) {
      emit(OrdersFailureState(
        message: e.toString(),
      ));
    }
  }

  sortGraphData(
      {required List<OrderGraphData> graphData,
      GraphFilter filter = GraphFilter.hours}) {
    graphData.sort((order1, order2) {
      if (filter == GraphFilter.hours) {
        final order1Time = order1.time.toMinutesSinceMidnight();
        return order1Time!.compareTo(order2.time.toInt() ?? 0);
      }
      final order1Time = order1.time.toInt();
      return order1Time!.compareTo(order2.time.toInt() ?? 0);
    });
  }

  List<OrderGraphData> _fillGraphOrdersList(Map<String, int> groupedData) {
    final ordersGraphData = groupedData.entries
        .map((entry) => OrderGraphData(time: entry.key, count: entry.value))
        .toList();
    return ordersGraphData;
  }
}
