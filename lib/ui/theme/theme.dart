import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_blog/gen/fonts.gen.dart';
import 'package:tech_blog/ui/theme/colors.dart';

class CustomTheme {
  static ThemeData lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: bgColor,
    appBarTheme: const AppBarTheme(
      color: bgColor,
      elevation: 0,
    ),
    textTheme: TextTheme(
      bodySmall: TextStyle(
        fontFamily: FontFamily.vazir,
        color: blackColor,
        fontSize: ScreenUtil().setWidth(10),
      ),
      bodyMedium: TextStyle(
        fontFamily: FontFamily.vazir,
        color: blackColor,
        fontSize: ScreenUtil().setWidth(12),
      ),
      bodyLarge: TextStyle(
        fontFamily: FontFamily.vazir,
        color: blackColor,
        fontSize: ScreenUtil().setWidth(14),
      ),
    ),
  );
}
