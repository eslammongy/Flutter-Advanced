part of 'orders_cubit.dart';

abstract class OrdersStatus extends Equatable {
  const OrdersStatus();

  @override
  List<Object?> get props => [];
}

class OrdersInitialState extends OrdersStatus {
  const OrdersInitialState();
}

class OrdersLoadingState extends OrdersStatus {
  const OrdersLoadingState();
}

class OrdersLoadedState extends OrdersStatus {
  final List<OrderEntity> orders;
  const OrdersLoadedState({required this.orders});

  @override
  List<Object?> get props => [orders];
}

class OrdersLoadGraphState extends OrdersStatus {
  final List<OrderGraphData> graphData;
  final int totalOrders;
  final int maxHourlyOrders;
  final int minHourlyOrders;
  const OrdersLoadGraphState({
    required this.graphData,
    required this.totalOrders,
    required this.maxHourlyOrders,
    required this.minHourlyOrders,
  });

  @override
  List<Object?> get props => [
        graphData,
        totalOrders,
        maxHourlyOrders,
        minHourlyOrders,
      ];
}

class OrdersFailureState extends OrdersStatus {
  final String message;
  const OrdersFailureState({required this.message});

  @override
  List<Object?> get props => [message];
}
