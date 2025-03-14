import 'package:islamic_will/utils/constants.util.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    scrollbarTheme: const ScrollbarThemeData(
      thumbVisibility: WidgetStatePropertyAll(true),
    ),
    unselectedWidgetColor: AppColors.primary,
    colorScheme: const ColorScheme.light(
      //  seedColor: AppColors.primary,
      primary: AppColors.primary,
      // secondary: AppColors.primary,
      surface: AppColors.background,
      primaryContainer: AppColors.primary,
      brightness: Brightness.light,
    ),
    primaryColor: AppColors.primary,
    fontFamily: 'Roboto',
    cardTheme: CardTheme(
      elevation: .0,
      margin: const EdgeInsets.all(.0),
      color: AppColors.background,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
    ),
    textTheme: const TextTheme(
      labelLarge: TextStyle(
        fontSize: 15.0,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(
        color: AppColors.secondaryText,
      ),
      bodyMedium: TextStyle(
        color: AppColors.secondaryText,
      ),
      bodySmall: TextStyle(
        color: AppColors.secondaryText,
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.background,
      foregroundColor: AppColors.secondaryText,
      toolbarHeight: 80.0,
      elevation: .0,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: AppColors.primary,
      ),
      actionsIconTheme: IconThemeData(
        color: AppColors.primary,
        // color: AppColors.primary
      ),
      titleTextStyle: TextStyle(
        fontSize: 15.0,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w700,
        color: AppColors.secondaryText,
        overflow: TextOverflow.clip,
      ),
    ),
    iconTheme: const IconThemeData(
      color: AppColors.secondaryText,
    ),
    chipTheme: ChipThemeData(
      side: BorderSide.none,
      backgroundColor: AppColors.cardIconBackground.withValues(alpha: .1),
      labelStyle: const TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w600,
        color: AppColors.primary,
      ),
      secondaryLabelStyle: const TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w600,
        color: AppColors.background,
      ),
      selectedColor: AppColors.secondary,
      showCheckmark: false,
    ),
    scaffoldBackgroundColor: AppColors.background,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppValues.cardRadius),
        ),
        elevation: .0,
        padding: const EdgeInsets.all(8.0),
        textStyle: const TextStyle(
          fontSize: 14.0,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w700,
        ),
        foregroundColor: AppColors.background,
        backgroundColor: AppColors.primary,
        minimumSize: const Size(double.maxFinite, 56.0),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppValues.cardRadius),
        ),
        elevation: .0,
        padding: const EdgeInsets.all(8.0),
        textStyle: const TextStyle(
          fontSize: 16.0,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w700,
        ),
        foregroundColor: AppColors.background,
        backgroundColor: AppColors.primary,
        minimumSize: const Size(double.maxFinite, 56.0),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColors.cardBackground,
      filled: true,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 15.0,
      ),
      labelStyle: const TextStyle(
        color: AppColors.secondaryText,
        fontSize: 10.0,
        fontWeight: FontWeight.w500,
        fontFamily: 'Roboto',
      ),
      hintStyle: const TextStyle(
        color: AppColors.cardIconBackground,
        fontSize: 15.0,
        fontFamily: 'Roboto',
      ),
      errorStyle: const TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.w500,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppValues.cardRadius * .5),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppValues.cardRadius * .5),
        borderSide: BorderSide.none,
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppValues.cardRadius * .5),
        borderSide: BorderSide.none,
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppValues.cardRadius * .5),
        borderSide: BorderSide.none,
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppValues.cardRadius * .5),
        borderSide: BorderSide.none,
      ),
    ),
    dropdownMenuTheme: DropdownMenuThemeData(
      textStyle: const TextStyle(
        fontFamily: 'Roboto',
        color: AppColors.secondaryText,
        fontSize: 10.0,
        fontWeight: FontWeight.w400,
      ),
      menuStyle: const MenuStyle(
        /*   maximumSize: MaterialStatePropertyAll(
          Size(double.maxFinite, 200.0),
        ),*/
        backgroundColor: WidgetStatePropertyAll(
          AppColors.cardBackground,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: AppColors.cardIconBackground,
        filled: true,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 10.0,
        ),
        hintStyle: const TextStyle(
          color: AppColors.cardIconBackground,
          fontSize: 12.0,
          fontFamily: 'Roboto',
        ),
        floatingLabelStyle: const TextStyle(
          fontSize: 10.0,
          fontWeight: FontWeight.w600,
          color: AppColors.primary,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppValues.cardRadius),
          borderSide: const BorderSide(
            color: AppColors.borderColor,
            width: .0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppValues.cardRadius),
          borderSide: const BorderSide(color: AppColors.primary, width: 2.0),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppValues.cardRadius),
          borderSide: const BorderSide(color: Colors.redAccent, width: .5),
        ),
      ),
    ),
  );
}
