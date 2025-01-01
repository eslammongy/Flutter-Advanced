import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_advanced/core/constant/app_strings.dart';
import 'package:flutter_advanced/core/theme/app_theme.dart';
import 'package:flutter_advanced/core/theme/text_style.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

abstract class SyncfusionAxisBuilder {
  static NumericAxis buildNumericAxis(BuildContext context) {
    return NumericAxis(
      numberFormat: NumberFormat.compact(),
      minimum: 0,
      interval: 1,
      rangePadding: ChartRangePadding.additional,
      majorTickLines: MajorTickLines(
        color: context.theme.colorScheme.secondary,
        width: 2,
        size: 6,
      ),
      title: AxisTitle(
        text: AppStrings.appName,
        alignment: ChartAlignment.far,
      ),
      labelStyle: AppTextStyles.regular14(context),
      labelAlignment: LabelAlignment.center,
      axisLine: AxisLine(
        color: context.theme.colorScheme.secondary,
        width: 2,
      ),
    );
  }

  static CategoryAxis buildCategoryAxis(BuildContext context) {
    return CategoryAxis(
      labelRotation: 45, // Rotate labels for better readability
      majorTickLines: MajorTickLines(
        color: context.theme.colorScheme.secondary,
        width: 2,
        size: 6,
      ),
      title: AxisTitle(
        text: AppStrings.time,
        alignment: ChartAlignment.far,
      ),
      labelStyle: AppTextStyles.regular14(context),
      labelAlignment: LabelAlignment.center,
      axisLine: AxisLine(
        color: context.theme.colorScheme.secondary,
        width: 2,
      ),
    );
  }
}
