import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/exports.dart';

class AppTheme {
  static ThemeData themeData = ThemeData(
    fontFamily: AppFonts.pingFontFamily,
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      elevation: 0,
    ),
    primaryColor: AppColors.primaryColor,
    primaryColorLight: AppColors.primaryColor.withOpacity(0.7),
    primaryColorDark: AppColors.secondaryColor,
    scaffoldBackgroundColor: AppColors.scaffoldBgColor,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.secondaryColor, // Change cursor color here
      selectionColor: AppColors.n75Color,
      selectionHandleColor: AppColors.primaryColor,
    ),
    checkboxTheme: CheckboxThemeData(
      checkColor: WidgetStateProperty.resolveWith<Color>(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return AppColors.primaryColor;
          }
          return AppColors.primaryColor;
        },
      ),
      fillColor: WidgetStateProperty.resolveWith<Color>(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return AppColors.n50Color;
          }
          return AppColors.n50Color;
        },
      ),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      side: const BorderSide(color: AppColors.t75Color),
    ),
    radioTheme: RadioThemeData(
      fillColor: WidgetStateProperty.resolveWith<Color>(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return AppColors.g200GreyColor;
          }
          return AppColors.g500GreyColor;
        },
      ),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.primaryColor,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedIconTheme: IconThemeData(size: 0),
      unselectedIconTheme: IconThemeData(size: 0),
      selectedLabelStyle: TextStyle(fontSize: 0),
      unselectedLabelStyle: TextStyle(fontSize: 0),
    ),
    colorScheme: const ColorScheme.light(primary: AppColors.primaryColor),
    datePickerTheme: DatePickerThemeData(
        backgroundColor: Colors.white,
        headerBackgroundColor: AppColors.primaryColor,
        headerForegroundColor: Colors.white,
        dayBackgroundColor: WidgetStateProperty.resolveWith<Color?>(
          (states) {
            if (states.contains(WidgetState.selected)) {
              return AppColors.primaryColor; // Selected day background color
            }
            return Colors.transparent;
          },
        ),
        todayBackgroundColor: WidgetStateProperty.resolveWith<Color>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.disabled)) {
              return AppColors.primaryColor.withValues(alpha: 0.4);
            } else if (states.contains(WidgetState.selected)) {
              return AppColors.primaryColor;
            }
            return AppColors.primaryColor
                .withValues(alpha: 0.4); // Background for today when not selected
          },
        )),
  );
}
