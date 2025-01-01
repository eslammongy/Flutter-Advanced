import 'package:dartz/dartz.dart';
import 'package:flutter_advanced/features/graph_metrics/domain/entities/order.dart';

abstract class OrderRepository {
  /// Fetches all orders from the JSON file and returns a list of order entities.
  Future<Either<Exception, List<OrderEntity>>> fetchAllOrders();
}
