import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/theme/app_theme.dart';
import 'package:flutter_advanced/core/utils/dependency_injection.dart';
import 'package:provider/provider.dart';

import 'core/routes/app_routes.dart';
import 'core/utils/theme_notifier.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppDependencies();
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeNotifier(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, themeNotifier, child) {
        return MaterialApp.router(
          title: "Flutter Advanced",
          debugShowCheckedModeBanner: false,
          themeMode: themeNotifier.themeMode,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          routerConfig: AppRoutes.routes,
        );
      },
    );
  }
}
