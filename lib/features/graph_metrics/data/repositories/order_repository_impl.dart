import 'package:dartz/dartz.dart';
import 'package:flutter_advanced/features/graph_metrics/data/datasource/order_data_source.dart';
import 'package:flutter_advanced/features/graph_metrics/data/models/order_model.dart';
import 'package:flutter_advanced/features/graph_metrics/domain/entities/order.dart';
import 'package:flutter_advanced/features/graph_metrics/domain/repositories/order_repository.dart';

class OrderRepositoryImpl implements OrderRepository {
  final OrderDataSource orderDataSource;
  const OrderRepositoryImpl({required this.orderDataSource});

  @override
  Future<Either<Exception, List<OrderEntity>>> fetchAllOrders() async {
    try {
      final jsonResult = await orderDataSource.fetchOrdersFromFile();
      final orders =
          jsonResult.map((order) => OrderModel.fromJson(order)).toList();
      return right(orders);
    } catch (exp) {
      final expMsg = exp.toString();
      return left(Exception(expMsg));
    }
  }
}
