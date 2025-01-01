import 'package:flutter_advanced/features/graph_metrics/presentation/views/screen/graph_screen.dart';
import 'package:flutter_advanced/features/home/screen/adaptive_home_layout.dart';
import 'package:flutter_advanced/features/payments/payment_screen.dart';
import 'package:go_router/go_router.dart';

abstract class AppRoutes {
  static const String initialRoute = '/';
  static const String graphRoute = '/graph';
  static const String paymentRoute = '/payment';

  static GoRouter get routes {
    return GoRouter(
      routes: [
        GoRoute(
          path: initialRoute,
          builder: (context, state) {
            return AdaptiveHomeLayout();
          },
        ),
        GoRoute(
          path: graphRoute,
          builder: (context, state) {
            return const GraphScreen();
          },
        ),
        GoRoute(
          path: paymentRoute,
          builder: (context, state) {
            return const PaymentScreen();
          },
        ),
      ],
    );
  }
}
