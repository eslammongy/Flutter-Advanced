import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/theme/app_theme.dart';
import 'package:flutter_advanced/core/theme/text_style.dart';

class BottomNavItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isActive;
  final Function()? onTap;

  const BottomNavItem({
    super.key,
    required this.title,
    required this.icon,
    required this.isActive,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final activeColor = context.theme.colorScheme.primary;

    return InkWell(
      borderRadius: BorderRadius.circular(100),
      splashColor: Colors.transparent,
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            color:
                isActive ? activeColor.withOpacity(0.45) : Colors.transparent,
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Icon(icon,
                  size: 24, color: isActive ? Colors.white : Colors.grey),
            ),
          ),
          if (isActive)
            Text(
              title,
              style: AppTextStyles.bold16(context).copyWith(
                color: context.theme.colorScheme.onSurface,
                letterSpacing: 1.2,
              ),
            )
        ],
      ),
    );
  }
}
