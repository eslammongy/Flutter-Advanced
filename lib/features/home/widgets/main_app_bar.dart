import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/constant/app_strings.dart';
import 'package:flutter_advanced/core/theme/app_theme.dart';
import 'package:flutter_advanced/core/theme/text_style.dart';
import 'package:flutter_advanced/core/utils/size_config.dart';
import 'package:flutter_advanced/core/utils/theme_notifier.dart';
import 'package:flutter_advanced/features/home/widgets/menu_taps.dart';
import 'package:provider/provider.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({super.key, this.getCurrentIndex});
  final GetCurrentIndex? getCurrentIndex;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.theme.colorScheme;

    return AppBar(
      title: Text(
        AppStrings.appName,
        style: AppTextStyles.bold20(context),
      ),
      centerTitle: false,
      backgroundColor: SizeConfig().isMobile
          ? colorScheme.surface
          : colorScheme.primaryContainer,
      actions: [
        if (!SizeConfig().isMobile) ...[
          MenuTaps(
            getCurrentIndex: getCurrentIndex,
          ),
        ],
        buildThemeToggle(context),
      ],
    );
  }

  Widget buildThemeToggle(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return IconButton(
      icon: Icon(
        themeNotifier.isDarkTheme
            ? Icons.light_mode_rounded
            : Icons.brightness_7_rounded,
      ),
      onPressed: () {
        themeNotifier.toggleTheme(
          themeNotifier.isDarkTheme ? ThemeMode.light : ThemeMode.dark,
        );
      },
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
