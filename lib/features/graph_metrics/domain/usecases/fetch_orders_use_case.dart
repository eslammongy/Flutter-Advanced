import 'package:dartz/dartz.dart';
import 'package:flutter_advanced/features/graph_metrics/domain/entities/order.dart';
import 'package:flutter_advanced/features/graph_metrics/domain/repositories/order_repository.dart';

class FetchOrdersUseCase {
  final OrderRepository ordersRepository;

  FetchOrdersUseCase({required this.ordersRepository});

  Future<Either<Exception, List<OrderEntity>>> call() async =>
      await ordersRepository.fetchAllOrders();
}
