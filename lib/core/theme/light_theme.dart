import 'package:flutter/material.dart';
import 'package:template_flutter/utils/color/app_colors.dart';
import 'package:template_flutter/utils/config/app_config.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: AppColors.bgColor,
  fontFamily: AppConfig.fontFamily,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.bgColor,
    elevation: 0,
    centerTitle: true,
    iconTheme: IconThemeData(color: AppColors.blackColor),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.blueColor900,
      foregroundColor: Colors.white,
      minimumSize: const Size(100, 40),
      padding: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      textStyle: const TextStyle(
        fontFamily: AppConfig.fontFamily,
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      side: const BorderSide(color: AppColors.blueColor900, width: 1.5),
      foregroundColor: Colors.black,
      minimumSize: const Size(100, 40),
      padding: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      textStyle: const TextStyle(
        fontFamily: AppConfig.fontFamily,
        fontSize: 14,
        fontWeight: FontWeight.w700,
      ),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColors.primaryText,
      textStyle: const TextStyle(
        fontFamily: AppConfig.fontFamily,
        fontWeight: FontWeight.w600,
        fontSize: 14,
        decoration: TextDecoration.underline,
      ),
    ),
  ),
  iconTheme: const IconThemeData(
    color: AppColors.gray,
  ),
  inputDecorationTheme: InputDecorationTheme(

    filled: true,
    fillColor: AppColors.whiteColor,
    iconColor: AppColors.gray,
    prefixIconColor: AppColors.gray,
    suffixIconColor: AppColors.gray,
    contentPadding: const EdgeInsets.symmetric(
      horizontal: 12,
      vertical: 8,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
          color: AppColors.primaryColor
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        width: 2,
        color: AppColors.errorColor,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        width: 2,
        color: AppColors.errorColor,
      ),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
          color: AppColors.primaryColor
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
          color: AppColors.primaryColor
      ),
    ),
    hintStyle: const TextStyle(
      fontFamily: AppConfig.fontFamily,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.secondaryText,
    ),
    errorStyle: const TextStyle(
      fontFamily: AppConfig.fontFamily,
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: AppColors.errorColor,
    ),
  ),
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      fontFamily: AppConfig.fontFamily,
      fontSize: 32,
      fontWeight: FontWeight.w600,
      color: AppColors.primaryText,
    ),
    headlineMedium: TextStyle(
      fontFamily: AppConfig.fontFamily,
      fontSize: 28,
      fontWeight: FontWeight.w600,
      color: AppColors.primaryText,
    ),
    headlineSmall: TextStyle(
      fontFamily: AppConfig.fontFamily,
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: AppColors.primaryText,
    ),
    titleLarge: TextStyle(
      fontFamily: AppConfig.fontFamily,
      fontSize: 22,
      fontWeight: FontWeight.w600,
      color: AppColors.primaryText,
    ),
    titleMedium: TextStyle(
      fontFamily: AppConfig.fontFamily,
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: AppColors.primaryText,
    ),
    titleSmall: TextStyle(
      fontFamily: AppConfig.fontFamily,
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: AppColors.primaryText,
    ),
    bodyLarge: TextStyle(
      fontFamily: AppConfig.fontFamily,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppColors.secondaryText,
    ),
    bodyMedium: TextStyle(
      fontFamily: AppConfig.fontFamily,
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: AppColors.secondaryText,
    ),
    bodySmall: TextStyle(
      fontFamily: AppConfig.fontFamily,
      fontSize: 10,
      fontWeight: FontWeight.w500,
      color: AppColors.secondaryText,
    ),
    labelLarge: TextStyle(
      fontFamily: AppConfig.fontFamily,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: AppColors.primaryText,
    ),
    labelMedium: TextStyle(
      fontFamily: AppConfig.fontFamily,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppColors.primaryText,
    ),
    labelSmall: TextStyle(
      fontFamily: AppConfig.fontFamily,
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: AppColors.primaryText,
    ),
  ),
);