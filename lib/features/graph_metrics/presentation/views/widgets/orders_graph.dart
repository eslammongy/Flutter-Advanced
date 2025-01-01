import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/constant/app_strings.dart';
import 'package:flutter_advanced/core/theme/app_theme.dart';
import 'package:flutter_advanced/core/utils/size_config.dart';
import 'package:flutter_advanced/core/utils/syncfusion_axis_builder.dart';
import 'package:flutter_advanced/features/graph_metrics/domain/entities/order_graph_data.dart';
import 'package:flutter_advanced/features/graph_metrics/presentation/cubit/orders_cubit.dart';
import 'package:flutter_advanced/features/graph_metrics/presentation/views/widgets/graph_summary.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class OrdersGraph extends StatelessWidget {
  const OrdersGraph({
    super.key,
    required this.graphData,
    required this.totalOrders,
    required this.maxHourlyOrders,
    required this.minHourlyOrders,
  });
  final List<OrderGraphData> graphData;
  final int totalOrders;
  final int maxHourlyOrders;
  final int minHourlyOrders;

  @override
  Widget build(BuildContext context) {
    final orderCubit = OrdersCubit.get(context);
    return Column(
      children: [
        SizedBox(
          height: 360,
          width: graphWidth,
          child: SfCartesianChart(
            primaryXAxis: SyncfusionAxisBuilder.buildCategoryAxis(context),
            primaryYAxis: SyncfusionAxisBuilder.buildNumericAxis(context),
            legend: Legend(
              isVisible: false, // Remove unnecessary legend
            ),
            tooltipBehavior: TooltipBehavior(enable: true),
            series: <CartesianSeries>[
              buildColumnSeries(context, graphData),
            ],
          ),
        ),
        const SizedBox(height: 10),
        GraphSummary(
          label: "${AppStrings.totalOrders} $totalOrders",
          icon: Icons.legend_toggle_rounded,
          color: context.theme.colorScheme.primary,
        ),
        const SizedBox(height: 10),
        GraphSummary(
          label:
              "${AppStrings.maxOrderGraphSummary(orderCubit.graphFilter)} $maxHourlyOrders",
          icon: Icons.trending_up_rounded,
          color: context.theme.colorScheme.primary,
        ),
        const SizedBox(height: 10),
        GraphSummary(
          label:
              "${AppStrings.maxOrderGraphSummary(orderCubit.graphFilter)} $minHourlyOrders",
          icon: Icons.trending_down_rounded,
          color: context.theme.colorScheme.primary,
        )
      ],
    );
  }

  double get graphWidth =>
      SizeConfig().isMobile ? double.infinity : SizeConfig().width * 0.6;

  ColumnSeries<OrderGraphData, String> buildColumnSeries(
    BuildContext context,
    List<OrderGraphData>? dataSource,
  ) {
    return ColumnSeries<OrderGraphData, String>(
      name: AppStrings.appName,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10), topRight: Radius.circular(10)),
      width: 0.4,
      dataSource: dataSource,
      xValueMapper: (OrderGraphData data, _) => data.time,
      yValueMapper: (OrderGraphData data, _) => data.count,
      color: context.theme.colorScheme.primary,
    );
  }
}
