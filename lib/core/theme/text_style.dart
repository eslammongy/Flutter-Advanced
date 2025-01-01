import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/utils/size_config.dart';

abstract class AppTextStyles {
  static TextStyle _style(
    BuildContext context,
    double fontSize,
    FontWeight fontWeight,
  ) {
    return TextStyle(
        fontSize: SizeConfig().scaleText(fontSize),
        fontWeight: fontWeight,
        fontFamily: "Inter");
  }

  //static const String openSansFM = "OpenSans";
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;

  static TextStyle regular16(BuildContext context) => _style(
        context,
        16,
        regular,
      );
  static TextStyle bold16(BuildContext context) => _style(
        context,
        16,
        bold,
      );
  static TextStyle medium16(BuildContext context) => _style(
        context,
        16,
        medium,
      );
  static TextStyle medium18(BuildContext context) => _style(
        context,
        18,
        medium,
      );
  static TextStyle medium20(BuildContext context) => _style(
        context,
        20,
        medium,
      );

  static TextStyle semiBold20(BuildContext context) => _style(
        context,
        20,
        semiBold,
      );

  static TextStyle bold20(BuildContext context) => _style(
        context,
        20,
        bold,
      );
  static TextStyle bold24(BuildContext context) => _style(
        context,
        24,
        bold,
      );

  static TextStyle semiBold24(BuildContext context) => _style(
        context,
        24,
        semiBold,
      );
  static TextStyle semiBold30(BuildContext context) => _style(
        context,
        30,
        semiBold,
      );
  static TextStyle bold40(BuildContext context) => _style(
        context,
        40,
        bold,
      );
  static TextStyle bold52(BuildContext context) => _style(
        context,
        52,
        bold,
      );
  static TextStyle regular12(BuildContext context) => _style(
        context,
        12,
        regular,
      );
  static TextStyle regular14(BuildContext context) => _style(
        context,
        14,
        regular,
      );
}
