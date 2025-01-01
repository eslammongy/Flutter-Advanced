import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/constant/app_assets_manager.dart';
import 'package:flutter_advanced/core/theme/app_theme.dart';
import 'package:flutter_advanced/core/theme/text_style.dart';

BoxDecoration pubBoxDecoration(BuildContext context) => BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      boxShadow: [staticBoxShadow],
      color: context.theme.colorScheme.tertiaryContainer,
    );

get staticBoxShadow => BoxShadow(
      color: Colors.black.withOpacity(0.2), // Shadow color with transparency
      spreadRadius: 2, // How far the shadow extends
      blurRadius: 2, // Blur effect
      offset: const Offset(1, 1), // Shadow position (x, y)
    );

extension StringToDouble on String {
  /// This String extension method is used to convert String price to double
  double? priceToDouble() {
    try {
      String cleanedString = replaceAll(RegExp(r'[^\d.-]'), '');
      return double.parse(cleanedString);
    } catch (e) {
      return null;
    }
  }
}

/// This function is used for rounded the ordered datetime to nearest hour
DateTime roundToNearestHour(DateTime dateTime) {
  // Check if the minutes are 30 or more to round up
  if (dateTime.minute >= 30) {
    return DateTime(
      dateTime.year,
      dateTime.month,
      dateTime.day,
      dateTime.hour + 1, // Add one hour
    );
  } else {
    return DateTime(
      dateTime.year,
      dateTime.month,
      dateTime.day,
      dateTime.hour, // Keep the same hour
    );
  }
}

/// This method is used to display a error or exception widget
Center displayErrorWidget(
  BuildContext context, {
  String errorMsg = "Sorry, something went wrong",
}) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 100,
        ),
        Image.asset(
          AppAssetsManager.dataImg,
          height: 260,
          fit: BoxFit.contain,
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline_rounded,
              color: context.theme.colorScheme.error,
              size: 32,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              errorMsg,
              textAlign: TextAlign.center,
              style: AppTextStyles.bold16(context),
            ),
          ],
        ),
      ],
    ),
  );
}

extension StringToInt on String {
  /// Converts the string to an integer.
  /// Returns `null` if the string cannot be converted.
  int? toInt() {
    try {
      return int.parse(this);
    } catch (e) {
      return null; // Return null for invalid input
    }
  }
}

extension StringToTimeInt on String {
  /// Converts a time string in the format "HH:mm" to the total minutes since midnight.
  /// Returns `null` for invalid inputs.
  int? toMinutesSinceMidnight() {
    try {
      final parts = split(':');
      if (parts.length != 2) return null;

      final hours = int.parse(parts[0]);
      final minutes = int.parse(parts[1]);

      if (hours < 0 || hours > 23 || minutes < 0 || minutes > 59) return null;

      return hours * 60 + minutes;
    } catch (e) {
      return null;
    }
  }
}

/// displaying a customized snack bar
void displaySnackBar(
  BuildContext context,
  String msg, {
  bool isFailState = true,
}) {
  final theme = context.theme;
  final snackBar = SnackBar(
    content: Center(
      child: Text(
        msg,
        maxLines: 3,
        style: AppTextStyles.bold20(context).copyWith(
          color: Colors.white,
        ),
      ),
    ),
    margin: const EdgeInsets.only(right: 20, left: 20, bottom: 40),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    backgroundColor:
        isFailState ? theme.colorScheme.error : theme.colorScheme.primary,
    duration: const Duration(milliseconds: 2000),
    behavior: SnackBarBehavior.floating,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
