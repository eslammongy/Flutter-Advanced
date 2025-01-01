import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/constant/app_strings.dart';
import 'package:flutter_advanced/core/theme/app_theme.dart';
import 'package:flutter_advanced/core/utils/size_config.dart';

import 'bottom_nav_bar_item.dart';

typedef GetCurrentIndex = void Function(int index);

class FloatingBottomNavBar extends StatelessWidget {
  final Function()? onAddBtnTap;
  final GetCurrentIndex getCurrentIndex;
  final int currentIndex;
  const FloatingBottomNavBar({
    super.key,
    this.onAddBtnTap,
    required this.getCurrentIndex,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    final appColors = context.theme.colorScheme;
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: 20, horizontal: SizeConfig.mobileBreakpoint * 0.2),
      child: SizedBox(
        height: kBottomNavigationBarHeight + 30,
        child: DecoratedBox(
          decoration: buildBoxDecoration(appColors),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BottomNavItem(
                title: AppStrings.metric,
                icon: Icons.dashboard_rounded,
                isActive: currentIndex == 0 ? true : false,
                onTap: () {
                  getCurrentIndex(0);
                },
              ),
              BottomNavItem(
                title: AppStrings.graph,
                icon: Icons.line_axis_rounded,
                isActive: currentIndex == 1 ? true : false,
                onTap: () {
                  getCurrentIndex(1);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration buildBoxDecoration(ColorScheme appColors) {
    return BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      color: appColors.primaryContainer,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.3),
          spreadRadius: 2,
          blurRadius: 2,
          offset: const Offset(1, 1),
        )
      ],
    );
  }
}
