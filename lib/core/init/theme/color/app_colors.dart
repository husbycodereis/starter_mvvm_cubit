import 'package:flutter/material.dart';
import 'package:starter_mvvm_cubit/core/extensions/string_extensions.dart';

import '../app_theme_manager.dart';

abstract class AppColors {
  //Unique Colors
  Color stormyHorizon = '737997'.color;
  Color adamantineBlue = '46B2FF'.color;
  Color white = 'FFFFFF'.color;
  Color black = '000000'.color;
  Color carbonfiber = '2D2D2D'.color;
  Color dividerColor = 'EBECF0'.color;
  Color grenadinePink = 'FF646E'.color;

  //Overrided Colors
  late Color textColor;
  late Color mapViewIconColor;
  late Color primaryColor;
  late Color primaryContainer;
  late Color secondaryColor;
  late Color secondaryContainer;
  late Color tertiaryColor;
  late Color tertiaryContainer;
}

class LightColors extends AppColors {
  ColorScheme colorScheme = AppThemeManager.instance.lightTheme.colorScheme;
  @override
  Color get textColor => white;
  @override
  Color get mapViewIconColor => carbonfiber;
  @override
  Color get primaryColor => colorScheme.primary;
  @override
  Color get primaryContainer => colorScheme.primaryContainer;
  @override
  Color get secondaryColor => colorScheme.secondary;
  @override
  Color get secondaryContainer => colorScheme.secondaryContainer;
  @override
  Color get tertiaryColor => colorScheme.tertiary;
  @override
  Color get tertiaryContainer => colorScheme.tertiaryContainer;
}

class DarkColors extends AppColors {
  ColorScheme colorScheme = AppThemeManager.instance.darkTheme.colorScheme;
  @override
  Color get textColor => black;
  @override
  Color get mapViewIconColor => white;
  @override
  Color get primaryColor => colorScheme.primary;
  @override
  Color get primaryContainer => colorScheme.primaryContainer;
  @override
  Color get secondaryColor => colorScheme.secondary;
  @override
  Color get secondaryContainer => colorScheme.secondaryContainer;
  @override
  Color get tertiaryColor => colorScheme.tertiary;
  @override
  Color get tertiaryContainer => colorScheme.tertiaryContainer;
}
