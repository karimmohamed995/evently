import 'package:evently/ui/utilities/app_colors.dart';
import 'package:flutter/material.dart';

abstract final class AppTheme {
  static final TextTheme _lightTextTheme = TextTheme(
    titleSmall: TextStyle(
      fontSize: 16,
      color: AppColors.gray,
      fontWeight: FontWeight.w500,
    ),
    labelMedium: TextStyle(
      fontSize: 16,
      color: AppColors.purple,
      fontWeight: FontWeight.bold,
    ),
    titleMedium: TextStyle(
      fontSize: 20,
      color: AppColors.purple,
      fontWeight: FontWeight.w500,
    ),
    labelSmall: TextStyle(
      fontSize: 16,
      color: AppColors.black,
      fontWeight: FontWeight.w500,
    ),
  );
  static final TextTheme _darkTextTheme = TextTheme(
    titleSmall: TextStyle(
      fontSize: 16,
      color: AppColors.offWhite,
      fontWeight: FontWeight.w500,
    ),
    labelMedium: TextStyle(
      fontSize: 16,
      color: AppColors.purple,
      fontWeight: FontWeight.bold,
    ),
    titleMedium: TextStyle(
      fontSize: 20,
      color: AppColors.purple,
      fontWeight: FontWeight.w500,
    ),
    labelSmall: TextStyle(
      fontSize: 16,
      color: AppColors.white,
      fontWeight: FontWeight.w500,
    ),
  );

  static final lightDefaultTextBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: BorderSide(color: AppColors.gray),
  );
  static final darkDefaultTextBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: BorderSide(color: AppColors.gray),
  );
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.purple,
    scaffoldBackgroundColor: AppColors.white,
    textTheme: _lightTextTheme,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w400,
        color: AppColors.purple,
      ),
    ),
    // colorScheme: ColorScheme.fromSeed(seedColor: AppColors.purple),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.purple,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: AppColors.purple),
        ),
        padding: EdgeInsets.symmetric(vertical: 16),
        textStyle: TextStyle(
          color: AppColors.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: lightDefaultTextBorder,
      focusedBorder: lightDefaultTextBorder,
      enabledBorder: lightDefaultTextBorder,
      hintStyle: _lightTextTheme.titleSmall,
      // prefixIconConstraints: BoxConstraints(maxHeight: 24, maxWidth: 24),
    ),
    dividerTheme: DividerThemeData(color: AppColors.purple, thickness: 1),
  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.darkPurple,
    primaryColor: AppColors.purple,
    textTheme: _darkTextTheme,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.purple,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
    ),
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.purple),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        // backgroundColor: AppColors.purple,
        padding: EdgeInsets.symmetric(vertical: 16),
        textStyle: TextStyle(
          color: AppColors.darkPurple,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: darkDefaultTextBorder,
      focusedBorder: darkDefaultTextBorder,
      enabledBorder: darkDefaultTextBorder,
    ),
  );
}
