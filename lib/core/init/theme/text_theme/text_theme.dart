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
        headline1: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.bold, ),
        headline2: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w300, letterSpacing: -0.5),
        headline3: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600, ),
        headline4: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600, letterSpacing: 0.25, ),
        overline: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600, letterSpacing: 0.5, ),
        bodyText1: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, letterSpacing: 0.5, ),
        bodyText2: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600, letterSpacing: 0.25,));
  }
}
