import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petstore/core/theme/app_colors.dart';
import 'package:petstore/core/theme/app_text_styles.dart';


abstract  class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      fontFamily: AppTextStyles.fontFamily,

      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        onPrimary: AppColors.textOnPrimary,

        secondary: AppColors.secondary,
        onSecondary: AppColors.textPrimary,

        surface: AppColors.surface,
        onSurface: AppColors.textPrimary,

        error: AppColors.error,
        onError: Colors.white,

        outline: AppColors.border,
      ),

      scaffoldBackgroundColor: AppColors.background,

      textTheme: AppTextStyles.textTheme,

      iconTheme:  IconThemeData(
        color: AppColors.primary,
        size: 24.sp,
      ),

      dialogTheme: DialogThemeData(
        backgroundColor: AppColors.surface,
        surfaceTintColor: Colors.transparent,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        titleTextStyle: AppTextStyles.textTheme.titleLarge,
        contentTextStyle: AppTextStyles.textTheme.bodyMedium,
      ),


      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColors.primaryDark,
        contentTextStyle: const TextStyle(
          fontFamily: AppTextStyles.fontFamily,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
    );
  }
}