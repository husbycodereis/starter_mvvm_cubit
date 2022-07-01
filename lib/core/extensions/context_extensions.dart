import 'dart:math';

import 'package:starter_mvvm_cubit/core/init/theme/color/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension ContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
}

extension MediaQueryExtension on BuildContext {
  double get height => mediaQuery.size.height;
  double get width => mediaQuery.size.width;

  double get lowValue => 16.w;
  double get lowVerticalValue => 18.h;
  double get highVerticalValue => 50.h;
  double get normalValue => 28.w;
  double get mediumValue => height * 0.033;
  double get highValue => height * 0.1;
}

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  ColorScheme get colors => theme.colorScheme;
  TextTheme get textTheme => theme.textTheme;
  Brightness get brightness => theme.brightness;
}

extension EmptySpaceExtension on BuildContext {
  SizedBox get sizedBoxLowVertical => SizedBox(height: lowValue);
  SizedBox get sizedBoxNormalVertical => SizedBox(height: normalValue);
  SizedBox get sizedBoxMediumVertical => SizedBox(height: mediumValue);
  SizedBox get sizedBoxHighVertical => SizedBox(height: highValue);

  SizedBox get sizedBoxLowHorizontal => SizedBox(width: lowValue);
  SizedBox get sizedBoxNormalHorizontal => SizedBox(width: normalValue);
  SizedBox get sizedBoxMediumHorizontal => SizedBox(width: mediumValue);
  SizedBox get sizedBoxHighHorizontal => SizedBox(width: highValue);
}

extension PaddingExtensionAll on BuildContext {
  EdgeInsets get paddingLowAll => EdgeInsets.all(lowValue);
  EdgeInsets get paddingNormalAll => EdgeInsets.all(normalValue);
  EdgeInsets get paddingMediumAll => EdgeInsets.all(mediumValue);
  EdgeInsets get paddingHighAll => EdgeInsets.all(highValue);
}

extension PaddingExtensionSymmetric on BuildContext {
  EdgeInsets get paddingLowVertical => EdgeInsets.symmetric(vertical: lowValue);
  EdgeInsets get paddingNormalVertical => EdgeInsets.symmetric(vertical: normalValue);
  EdgeInsets get paddingMediumVertical => EdgeInsets.symmetric(vertical: mediumValue);
  EdgeInsets get paddingHighVertical => EdgeInsets.symmetric(vertical: highValue);

  EdgeInsets get paddingLowHorizontal => EdgeInsets.symmetric(horizontal: lowValue);
  EdgeInsets get paddingNormalHorizontal => EdgeInsets.symmetric(horizontal: normalValue);
  EdgeInsets get paddingMediumHorizontal => EdgeInsets.symmetric(horizontal: mediumValue);
  EdgeInsets get paddingHighHorizontal => EdgeInsets.symmetric(horizontal: highValue);
}

extension RadiusExtension on BuildContext {
  Radius get lowRadius => Radius.circular(width * 0.02);
  Radius get normalRadius => Radius.circular(width * 0.05);
  Radius get highadius => Radius.circular(width * 0.1);
  BorderRadius get borderlowRadius => BorderRadius.circular(width * 0.02);
  BorderRadius get bordernormalRadius => BorderRadius.circular(width * 0.05);
  BorderRadius get borderhighadius => BorderRadius.circular(width * 0.1);
}

extension ColorExtension on BuildContext {
  Color get randomColor => Colors.primaries[Random().nextInt(17)];
  AppColors get appColors => brightness == Brightness.dark ? DarkColors() : LightColors();
}

extension DurationExtension on BuildContext {
  Duration get shortDuration => const Duration(milliseconds: 500);
  Duration get normalDuration => const Duration(seconds: 1);
}

extension SnackBarExtension on BuildContext {
  dynamic showSnackBar(String text) => ScaffoldMessenger.of(this).showSnackBar(SnackBar(
        content: Text(text, style: textTheme.bodyText1),
        backgroundColor: Colors.teal,
      ));
}
