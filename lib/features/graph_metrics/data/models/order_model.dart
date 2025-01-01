import 'package:flutter_advanced/core/utils/helper.dart';
import 'package:flutter_advanced/features/graph_metrics/domain/entities/order.dart';

class OrderModel extends OrderEntity {
  const OrderModel({
    super.id,
    super.company,
    super.buyer,
    super.isActive,
    super.price,
    super.pictureUrl,
    super.tags,
    super.status,
    super.registered,
  });

  /// Converts the order entity to a JSON map.
  Map<String, dynamic> toJson() => {
        'id': id,
        'isActive': isActive,
        'price': "$price",
        'company': company,
        'pictureUrl': pictureUrl,
        'buyer': buyer,
        'tags': tags,
        'registered': registered?.toIso8601String(),
        'status': status.name.toUpperCase(),
      };

  /// Creates an order entity from a JSON map.
  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        id: json['id'] as String?,
        isActive: json['isActive'] as bool? ?? false,
        price: (json['price'] as String?)?.priceToDouble(),
        company: json['company'] as String?,
        pictureUrl: json['pictureUrl'] as String?,
        buyer: json['buyer'] as String?,
        tags: List<String>.from(json['tags'] ?? []),
        registered: json['registered'] != null
            ? DateTime.parse(json['registered'] as String)
            : null,
        status: OrderStatus.values.firstWhere(
          (e) => e.name.toUpperCase() == json['status'],
          orElse: () => OrderStatus.ordered,
        ),
      );
}
