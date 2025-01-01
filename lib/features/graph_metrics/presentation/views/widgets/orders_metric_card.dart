import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/constant/app_strings.dart';

enum MetricLabels { total, average, returns }

class OrdersMetricCard extends StatelessWidget {
  const OrdersMetricCard({
    super.key,
    required this.label,
    required this.value,
    required this.icon,
  });
  final String label;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final labelColor = getLabelColor;

    return Card(
      elevation: 6,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: labelColor.withOpacity(0.3), width: 6)),
      color: colorScheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Optimize layout calculation
          crossAxisAlignment: CrossAxisAlignment.center, // Align content
          children: [
            CircleAvatar(
              backgroundColor: labelColor.withOpacity(0.8),
              child: Icon(icon, color: Colors.white),
            ),
            const SizedBox(height: 10),
            Text(
              label,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Text(
                value,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: labelColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Determines the color based on the metric label
  Color get getLabelColor {
    switch (label) {
      case AppStrings.totalOrders:
        return Color(0xff7149C6);
      case AppStrings.averagePrice:
        return Color(0xffFC2947);
      default:
        return Color(0xffFE6244);
    }
  }
}
