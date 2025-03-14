import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islamic_will/utils/constants.util.dart';

class QuranAppTheme {
// Light theme configuration
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        surface: AppColors.background,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.background,
        foregroundColor: AppColors.primaryText,
        elevation: 0,
        titleTextStyle: TextStyle(
          color: AppColors.primaryText,
          fontSize: AppDimensions.headingTextSize,
          fontWeight: FontWeight.w500,
        ),
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          color: AppColors.primaryText,
          fontSize: AppDimensions.headingTextSize,
          fontWeight: FontWeight.bold,
        ),
        titleLarge: TextStyle(
          color: AppColors.primaryText,
          fontSize: AppDimensions.titleTextSize,
          fontWeight: FontWeight.w500,
        ),
        bodyLarge: TextStyle(
          color: AppColors.primaryText,
          fontSize: AppDimensions.bodyTextSize,
        ),
        bodyMedium: TextStyle(
          color: AppColors.secondaryText,
          fontSize: AppDimensions.bodyTextSize,
        ),
        labelMedium: TextStyle(
          color: AppColors.secondaryText,
          fontSize: AppDimensions.captionTextSize,
        ),
      ),
      indicatorColor: AppColors.primary,
      cardTheme: CardTheme(
        color: AppColors.cardBackground,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimensions.cardRadius),
        ),
        margin: const EdgeInsets.symmetric(
          vertical: AppDimensions.itemSpacing * .5,
          horizontal: 0,
        ),
      ),
      iconTheme: const IconThemeData(
        color: AppColors.iconColor,
        size: AppDimensions.iconSize,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.buttonPrimary,
          foregroundColor: AppColors.buttonText,
          minimumSize: const Size(double.infinity, AppDimensions.buttonHeight),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimensions.cardRadius * .5),
          ),
          padding: AppDimensions.contentPadding,
          elevation: 0,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primary,
          side: const BorderSide(color: AppColors.primary),
          minimumSize: const Size(double.infinity, AppDimensions.buttonHeight),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimensions.cardRadius * .5),
          ),
          padding: AppDimensions.contentPadding,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.cardBackground,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.secondaryText,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),
      dividerColor: AppColors.borderColor,
      inputDecorationTheme: InputDecorationTheme(
        fillColor: AppColors.cardBackground,
        filled: true,
        contentPadding: AppDimensions.contentPadding,
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.borderColor),
          borderRadius: BorderRadius.circular(AppDimensions.cardRadius * .5),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.borderColor),
          borderRadius: BorderRadius.circular(AppDimensions.cardRadius * .5),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.primary),
          borderRadius: BorderRadius.circular(AppDimensions.cardRadius * .5),
        ),
        hintStyle: const TextStyle(color: AppColors.secondaryText),
      ),
      listTileTheme: ListTileThemeData(
        contentPadding: AppDimensions.contentPadding,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimensions.cardRadius),
        ),
      ),
    );
  }

// Dark theme configuration
  static ThemeData get darkTheme {
    return ThemeData(
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.darkBackground,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        surface: AppColors.darkModeSurface,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.darkBackground,
        foregroundColor: AppColors.lightText,
        elevation: 0,
        titleTextStyle: TextStyle(
          color: AppColors.lightText,
          fontSize: AppDimensions.headingTextSize,
          fontWeight: FontWeight.w500,
        ),
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          color: AppColors.lightText,
          fontSize: AppDimensions.headingTextSize,
          fontWeight: FontWeight.bold,
        ),
        titleLarge: TextStyle(
          color: AppColors.lightText,
          fontSize: AppDimensions.titleTextSize,
          fontWeight: FontWeight.w500,
        ),
        bodyLarge: TextStyle(
          color: AppColors.lightText,
          fontSize: AppDimensions.bodyTextSize,
        ),
        bodyMedium: TextStyle(
          color: AppColors.darkModeSecondaryText,
          fontSize: AppDimensions.bodyTextSize,
        ),
        labelMedium: TextStyle(
          color: AppColors.darkModeSecondaryText,
          fontSize: AppDimensions.captionTextSize,
        ),
      ),
      indicatorColor: AppColors.primary,
      cardTheme: CardTheme(
        color: AppColors.darkModeCardBackground,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimensions.cardRadius),
        ),
        margin: const EdgeInsets.symmetric(
          vertical: AppDimensions.itemSpacing * .5,
          horizontal: 0,
        ),
      ),
      iconTheme: const IconThemeData(
        color: AppColors.primary,
        size: AppDimensions.iconSize,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.buttonPrimary,
          foregroundColor: AppColors.buttonText,
          minimumSize: const Size(double.infinity, AppDimensions.buttonHeight),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimensions.cardRadius * .5),
          ),
          padding: AppDimensions.contentPadding,
          elevation: 0,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primary,
          side: const BorderSide(color: AppColors.primary),
          minimumSize: const Size(double.infinity, AppDimensions.buttonHeight),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimensions.cardRadius * .5),
          ),
          padding: AppDimensions.contentPadding,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.darkModeCardBackground,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.darkModeSecondaryText,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),
      dividerColor: AppColors.darkModeBorderColor,
      inputDecorationTheme: InputDecorationTheme(
        fillColor: AppColors.darkModeCardBackground,
        filled: true,
        contentPadding: AppDimensions.contentPadding,
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.darkModeBorderColor),
          borderRadius: BorderRadius.circular(AppDimensions.cardRadius * .5),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.darkModeBorderColor),
          borderRadius: BorderRadius.circular(AppDimensions.cardRadius * .5),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.primary),
          borderRadius: BorderRadius.circular(AppDimensions.cardRadius * .5),
        ),
        hintStyle: const TextStyle(color: AppColors.darkModeSecondaryText),
      ),
      listTileTheme: ListTileThemeData(
        contentPadding: AppDimensions.contentPadding,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimensions.cardRadius),
        ),
      ),
    );
  }
}
