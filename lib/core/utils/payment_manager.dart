import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

abstract class PaymentManager {
  static final Dio _dioClient = Dio();
  static final String _baseUrl = "https://api.stripe.com/v1/payment_intents";
  static Future<void> sendPaymentRequest(int amount, String currency) async {
    try {
      final calculatedAmount = (amount * 100).toString();
      String clientSecret = await _getClientSecret(
        amount: calculatedAmount,
        currency: currency,
      );
      await _initializePaymentSheet(clientSecret);
      await Stripe.instance.presentPaymentSheet();
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  static Future<void> _initializePaymentSheet(String clientSecret) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: clientSecret,
        merchantDisplayName: "Dev-Fox",
        style: ThemeMode.dark,
      ),
    );
  }

  static Future<String> _getClientSecret({
    required String amount,
    required String currency,
  }) async {
    final secretKey = dotenv.get('STRIPE_SECRET_KEY');

    final response = await _dioClient.post(
      _baseUrl,
      options: Options(
        headers: {
          'Authorization': 'Bearer $secretKey',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
      ),
      data: {
        'amount': amount,
        'currency': currency,
      },
    );
    return response.data["client_secret"];
  }
}
