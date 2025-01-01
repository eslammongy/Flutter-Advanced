import 'package:flutter/material.dart';
import 'adaptive_layout.dart';
import 'desktop_home_screen.dart';
import 'mobile_home_screen.dart';
import 'tablet_home_screen.dart';

class AdaptiveHomeLayout extends StatelessWidget {
  const AdaptiveHomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      mobileLayout: (context) => const MobileHomeScreen(),
      tabletLayout: (context) => const TabletHomeScreen(),
      desktopLayout: (context) => const DesktopHomeScreen(),
    );
  }
}
