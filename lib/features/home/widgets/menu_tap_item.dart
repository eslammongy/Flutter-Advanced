import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/theme/app_theme.dart';
import 'package:flutter_advanced/core/theme/text_style.dart';

class MenuTapItem extends StatelessWidget {
  const MenuTapItem({
    super.key,
    required this.isSelected,
    required this.text,
    this.onPressed,
  });
  final bool isSelected;
  final String text;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: onPressed,
          style: buttonStyle,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: isSelected
                ? AppTextStyles.regular16(context)
                    .copyWith(color: theme.colorScheme.primary)
                : AppTextStyles.regular14(context)
                    .copyWith(color: theme.colorScheme.onSurface),
          ),
        ),
        if (isSelected) ...[
          SizedBox(
            width: 40,
            height: 3,
            child: Divider(thickness: 2, color: theme.colorScheme.onSurface),
          ),
        ]
      ],
    );
  }

  get buttonStyle => ButtonStyle(
        alignment: Alignment.center,
        padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        ),
      );
}
