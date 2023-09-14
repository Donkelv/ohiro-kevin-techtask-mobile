import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tech_task/util/color_const.dart';

TextStyle largestTextInter() {
  return GoogleFonts.inter(
    fontSize: 32.0.sp,
    color: blackColor,
    fontWeight: FontWeight.w700,
  );
}

TextStyle largeTextInter() {
  return GoogleFonts.inter(
    fontSize: 25.0.sp,
    color: blackColor,
    fontWeight: FontWeight.w700,
  );
}

TextStyle semiLargeTextInter() {
  return GoogleFonts.inter(
    fontSize: 20.0.sp,
    color: blackColor,
    fontWeight: FontWeight.w600,
  );
}

TextStyle mediumTextInter() {
  return GoogleFonts.inter(
    fontSize: 16.0.sp,
    color: blackColor,
    //fontWeight: FontWeight.w500,
  );
}

TextStyle normalText() {
  return GoogleFonts.inter(
    fontSize: 14.0.sp,
    color: blackColor,
    //fontWeight: FontWeight.w400,
  );
}

TextStyle smallText() {
  return GoogleFonts.inter(
    fontSize: 12.0.sp,
    color: blackColor,
    fontWeight: FontWeight.w300,
  );
}

TextStyle smallestText() {
  return GoogleFonts.inter(
    fontSize: 10.0.sp,
    color: blackColor,
    fontWeight: FontWeight.w200,
  );
}

///GOLDPLAY
///
ThemeData customTheme() {
  final ThemeData themeData = ThemeData();

  //TextTheme _textTheme
  return themeData.copyWith(
    primaryColor:primaryColor,
    indicatorColor:primaryColor,
    scaffoldBackgroundColor: whiteColor,
    primaryIconTheme: themeData.primaryIconTheme.copyWith(
      color: blackColor,
      size: 20,
    ),
    iconTheme: themeData.iconTheme.copyWith(
      color: blackColor,
    ),
    tabBarTheme: themeData.tabBarTheme.copyWith(
      labelColor:primaryColor,
      unselectedLabelColor: grayColor200,
    ),
    buttonTheme:
        themeData.buttonTheme.copyWith(buttonColor:primaryColor),
    hintColor: grayColor500,
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: ZoomPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
  );
}
