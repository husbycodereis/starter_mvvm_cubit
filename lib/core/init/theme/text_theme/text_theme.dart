import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextThemeManager {
  static TextThemeManager? _instance;
  static TextThemeManager get instance {
    return _instance ??= TextThemeManager.init();
  }

  TextThemeManager.init();

  TextTheme textTheme() {
    return TextTheme(
        displayLarge: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.bold, ),
        displayMedium: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w300, letterSpacing: -0.5),
        displaySmall: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600, ),
        headlineMedium: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600, letterSpacing: 0.25, ),
        labelSmall: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600, letterSpacing: 0.5, ),
        bodyLarge: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, letterSpacing: 0.5, ),
        bodyMedium: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600, letterSpacing: 0.25,));
  }
}
