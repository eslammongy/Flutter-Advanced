import 'package:flutter_advanced/features/graph_metrics/presentation/views/widgets/graph_filter_component.dart';

abstract class AppStrings {
  static const String appName = 'Flutter Advanced';
  static const String numericMetric = "Orders Metric";
  static const String ordersFor = "Orders For";
  static const String metric = "Metrics";
  static const String graph = "Graph";
  static const String fetchOrdersExpMsg =
      "An unexpected error occurred while fetching the orders. Please try again later or contact support.";
  static const String jsonFileNotFound =
      "Asset or JSON file not found or incorrect path";
  static const String invalidJsonFormat =
      "The orders file contains invalid data.";

  static const String details = "Details";
  static const String totalOrders = "Total Orders";
  static const String averagePrice = "Average Price";
  static const String returnsOrders = "Returns Orders";
  static const String numericMetricForAllOrders =
      "Numeric Metric For All Orders";

  static const String time = "Time";
  static const String totalOrdersSummary = "Total Orders For This Month is ";
  static const String maxOrderSummary = "Max Order Per Hour is ";
  static const String monthlyEmptyOrders = "There is no data for this month";

  static String maxOrderGraphSummary(GraphFilter filter) {
    return filter == GraphFilter.hours
        ? "Max Order Per Hour is "
        : "Max Order Per Day is ";
  }

  static String minOrderGraphSummary(GraphFilter filter) {
    return filter == GraphFilter.hours
        ? "Min Order Per Hour is "
        : "Min Order Per Day is ";
  }
}
