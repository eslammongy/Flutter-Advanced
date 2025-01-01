import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/routes/app_routes.dart';
import 'package:flutter_advanced/core/theme/app_theme.dart';
import 'package:flutter_advanced/core/theme/text_style.dart';
import 'package:flutter_advanced/features/home/widgets/main_app_bar.dart';
import 'package:go_router/go_router.dart';

final advancedContent = <Map<String, dynamic>>[
  {
    'title': "Payments",
    'icon': Icons.payment,
    'route': AppRoutes.paymentRoute,
  },
  {
    'title': "Graph Metrics",
    'icon': Icons.bar_chart_rounded,
    'route': AppRoutes.graphRoute,
  },
];

class MobileHomeScreen extends StatelessWidget {
  const MobileHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: MainAppBar(),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.5,
        ),
        itemCount: advancedContent.length,
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          return _buildGridViewItem(context, index);
        },
      ),
    );
  }

  Widget _buildGridViewItem(BuildContext context, int index) {
    final route = advancedContent[index]['route'];
    debugPrint("Route: /$route");
    return InkWell(
      onTap: () {
        GoRouter.of(context).push(route);
      },
      child: Card(
        margin: const EdgeInsets.all(8),
        color: context.theme.colorScheme.primary,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                advancedContent[index]['icon'],
                size: 48,
                color: context.theme.colorScheme.onPrimary,
              ),
              const SizedBox(height: 16),
              Text(
                advancedContent[index]['title'],
                style: AppTextStyles.bold24(context).copyWith(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
