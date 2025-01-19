import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData theme() {
  return ThemeData(
    fontFamily: "Kanit",
    scaffoldBackgroundColor: Colors.white,
    textTheme: TextTheme(
      titleLarge: TextStyle(fontSize: 42.sp, color: Colors.black, fontWeight: FontWeight.w700),
      titleSmall: TextStyle(fontSize: 18.sp, color: Colors.black, fontWeight: FontWeight.w500),
      labelSmall: TextStyle(fontSize: 14.sp, color: Colors.black, fontWeight: FontWeight.w500),
      displayMedium: TextStyle(fontSize: 16.sp, color: Colors.white, fontWeight: FontWeight.w500)
    ),
  );
}