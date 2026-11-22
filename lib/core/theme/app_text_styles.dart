import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_colors.dart';

abstract  class AppTextStyles {
  static const String fontFamily = 'Nunito';

  static  TextTheme get textTheme => TextTheme(

    displayLarge: TextStyle(
      fontFamily: fontFamily,
      fontSize: 36.sp,
      fontWeight: FontWeight.w800,
      color: AppColors.textPrimary,
      letterSpacing: -1,
    ),

    displayMedium: TextStyle(
      fontFamily: fontFamily,
      fontSize: 32.sp,
      fontWeight: FontWeight.w800,
      color: AppColors.textPrimary,
    ),

    headlineLarge: TextStyle(
      fontFamily: fontFamily,
      fontSize: 28.sp,
      fontWeight: FontWeight.w800,
      color: AppColors.textPrimary,
    ),

    headlineMedium: TextStyle(
      fontFamily: fontFamily,
      fontSize: 24.sp,
      fontWeight: FontWeight.w700,
      color: AppColors.textPrimary,
    ),

    headlineSmall: TextStyle(
      fontFamily: fontFamily,
      fontSize: 20.sp,
      fontWeight: FontWeight.w700,
      color: AppColors.textPrimary,
    ),

    // Titles
    titleLarge: TextStyle(
      fontFamily: fontFamily,
      fontSize: 18.sp,
      fontWeight: FontWeight.w700,
      color: AppColors.textPrimary,
    ),

    titleMedium: TextStyle(
      fontFamily: fontFamily,
      fontSize: 16.sp,
      fontWeight: FontWeight.w700,
      color: AppColors.textPrimary,
    ),

    titleSmall: TextStyle(
      fontFamily: fontFamily,
      fontSize: 14.sp,
      fontWeight: FontWeight.w700,
      color: AppColors.textPrimary,
    ),

    bodyLarge: TextStyle(
      fontFamily: fontFamily,
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.textPrimary,
    ),

    bodyMedium: TextStyle(
      fontFamily: fontFamily,
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.textSecondary,
    ),

    bodySmall: TextStyle(
      fontFamily: fontFamily,
      fontSize: 12.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.textSecondary,
    ),

    labelLarge: TextStyle(
      fontFamily: fontFamily,
      fontSize: 14.sp,
      fontWeight: FontWeight.w800,
      color: AppColors.textPrimary,
    ),

    labelMedium: TextStyle(
      fontFamily: fontFamily,
      fontSize: 12.sp,
      fontWeight: FontWeight.w700,
      color: AppColors.textSecondary,
    ),

    labelSmall: TextStyle(
      fontFamily: fontFamily,
      fontSize: 11.sp,
      fontWeight: FontWeight.w600,
      color: AppColors.textHint,
    ),
  );
}