import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/theme/app_theme.dart';
import 'package:flutter_advanced/core/theme/text_style.dart';
import 'package:flutter_advanced/core/utils/dialog_manager.dart';
import 'package:flutter_advanced/core/utils/helper.dart';
import 'package:flutter_advanced/core/utils/payment_manager.dart';
import 'package:flutter_advanced/features/home/widgets/main_app_bar.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: Center(
        child: InkWell(
          onTap: () {
            LoadingDialogManager.of(context).displayDialog();
            PaymentManager.sendPaymentRequest(100, "EGP").then((_) {
              LoadingDialogManager.closeDialog();
              if (!context.mounted) return;
              displaySnackBar(
                context,
                "Payment completed successfully",
                isFailState: false,
              );
            }).catchError((error) {
              LoadingDialogManager.closeDialog();
              if (!context.mounted) return;
              displaySnackBar(
                context,
                "Unable to complete payment, please try again",
              );
            });
          },
          child: Card(
            color: context.theme.colorScheme.primary,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Send Stripe Payment",
                  style: AppTextStyles.bold16(context)),
            ),
          ),
        ),
      ),
    );
  }
}
