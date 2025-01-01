import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/theme/text_style.dart';

class GraphSummary extends StatelessWidget {
  const GraphSummary(
      {super.key,
      required this.label,
      required this.icon,
      required this.color});
  final String label;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Card(
            color: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Transform.scale(
                scale: 1.3,
                child: Icon(icon, color: Colors.white, size: 20),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            label,
            style: AppTextStyles.regular16(context),
          ),
        ],
      ),
    );
  }
}
