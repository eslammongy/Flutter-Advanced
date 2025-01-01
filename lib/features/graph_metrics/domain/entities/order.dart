import 'package:equatable/equatable.dart';

enum OrderStatus {
  delivered,
  ordered,
  returned,
}

class OrderEntity extends Equatable {
  final String? id;
  final bool isActive;
  final double? price;
  final String? company;
  final String? pictureUrl;
  final String? buyer;
  final List<String> tags;
  final DateTime? registered;
  final OrderStatus status;

  const OrderEntity({
    this.id,
    this.isActive = false,
    this.price,
    this.company,
    this.pictureUrl,
    this.buyer,
    this.tags = const [],
    this.registered,
    this.status = OrderStatus.ordered,
  });

  @override
  List<Object?> get props => [
        id,
        isActive,
        price,
        company,
        pictureUrl,
        buyer,
        tags,
        registered,
        status
      ];
}
