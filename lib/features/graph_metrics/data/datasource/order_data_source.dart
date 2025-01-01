import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_advanced/core/constant/app_strings.dart';

class OrderDataSource {
  /// Fetches orders from a JSON file.
  Future<List<dynamic>> fetchOrdersFromFile() async {
    try {
      // Simulate network delay
      return Future.delayed(Duration(seconds: 1), () async {
        final orderJson =
            await rootBundle.loadString('assets/json/orders.json');
        final orders = json.decode(orderJson);
        return orders;
      });
    } on FlutterError {
      throw Exception(AppStrings.jsonFileNotFound);
    } on FormatException {
      throw Exception(AppStrings.invalidJsonFormat);
    } catch (e) {
      throw Exception(AppStrings.fetchOrdersExpMsg);
    }
  }
}
