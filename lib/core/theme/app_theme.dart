// ignore_for_file: public_member_api_docs, sort_constructors_first, deprecated_member_use
import 'package:flutter/material.dart';
import 'package:test_app/core/theme/app_colors.dart';
import 'package:test_app/core/utils/app_sizing.dart';

class AppTheme {
  AppTheme();

  ThemeData get dark {
    return _themeData(
      brightness: Brightness.dark,
      colorScheme: ColorScheme.dark(
        primary: AppColors.primaryColor,
        surface: AppColors.darkBackgroundColor,
        outline: AppColors.gray[800]!,
        brightness: Brightness.dark,
        secondary: AppColors.secondaryColor,
        outlineVariant: AppColors.gray[700]!,
        onSurface: AppColors.gray[300]!,
        onSurfaceVariant: AppColors.gray[400]!,
        tertiary: AppColors.gray[900]!,
      ),
      scaffoldBackgroundColor: AppColors.darkBackgroundColor,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: _darkElevatedButtonStyle(),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: _darkOutlinedButtonStyle(),
      ),

      appBarTheme: AppBarTheme(color: AppColors.gray[900]!.withOpacity(.3)),
    );
  }

  ThemeData get light {
    return _themeData(
      brightness: Brightness.light,
      colorScheme: ColorScheme.light(
        primary: AppColors.primaryColor,
        brightness: Brightness.light,
        secondary: AppColors.secondaryColor,
        surface: AppColors.lightBackgroundColor,
        outline: AppColors.gray[300]!,
        outlineVariant: AppColors.gray[400]!,
        onSurface: AppColors.gray[700]!,
        onSurfaceVariant: AppColors.gray[600]!,
        tertiary: AppColors.gray[900]!,
      ),
      scaffoldBackgroundColor: AppColors.gray[100]!,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: _lightElevatedButtonStyle(),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: _lightOutlinedButtonStyle(),
      ),
      appBarTheme: AppBarTheme(color: AppColors.gray[100]!.withOpacity(.3)),
    );
  }

  ThemeData _themeData({
    required AppBarTheme appBarTheme,
    required ColorScheme colorScheme,
    required Brightness brightness,
    required ElevatedButtonThemeData elevatedButtonTheme,
    required Color scaffoldBackgroundColor,
    required OutlinedButtonThemeData outlinedButtonTheme,
  }) {
    return ThemeData(
      colorScheme: colorScheme,
      appBarTheme: appBarTheme,
      useMaterial3: true,
      applyElevationOverlayColor: true,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      fontFamily: "Euclid Circular A",
      brightness: brightness,
      primaryColor: AppColors.primaryColor,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          fixedSize: WidgetStatePropertyAll(Size.fromHeight(40)),
          backgroundColor: _primaryButtonStates,
          padding: WidgetStatePropertyAll(
            EdgeInsets.symmetric(horizontal: Insets.xl, vertical: 10),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          fixedSize: WidgetStatePropertyAll(Size.fromHeight(40)),
          side: _outlinedButtonStates,
          padding: WidgetStatePropertyAll(
            EdgeInsets.symmetric(horizontal: Insets.xl, vertical: 10),
          ),
        ),
      ),
    );
  }

  final _primaryButtonStates = WidgetStateProperty.resolveWith((states) {
    if (states.contains(WidgetState.hovered) ||
        states.contains(WidgetState.pressed)) {
      return const Color(0xffFB9E11).withOpacity(.7);
    }
    return AppColors.primaryColor;
  });
  final _outlinedButtonStates = WidgetStateProperty.resolveWith((states) {
    if (states.contains(WidgetState.hovered) ||
        states.contains(WidgetState.pressed)) {
      return BorderSide(color: const Color(0xffFB9E11).withOpacity(.7));
    }
    return BorderSide(color: const Color(0xffFB9E11).withOpacity(.7));
  });

  ButtonStyle _darkElevatedButtonStyle() => ButtonStyle(
    backgroundColor: WidgetStatePropertyAll(Color(0xffFB9E11).withOpacity(.7)),
    alignment: Alignment.center,
    elevation: WidgetStatePropertyAll(20),
    textStyle: WidgetStatePropertyAll(
      TextStyle(
        color: AppColors.gray[100],
        fontFamily: "Euclid Circular A",
        fontWeight: FontWeight.w500,
      ),
    ),
    enableFeedback: true,
    overlayColor: WidgetStatePropertyAll(AppColors.gray[800]!),
    animationDuration: Duration(milliseconds: 400),
    mouseCursor: WidgetStateMouseCursor.resolveWith((states) {
      return SystemMouseCursors.click;
    }),
    padding: WidgetStatePropertyAll(
      EdgeInsets.symmetric(horizontal: Insets.med, vertical: 4),
    ),
    // textStyle:
  );

  ButtonStyle _darkOutlinedButtonStyle() => ButtonStyle(
    // backgroundColor: WidgetStatePropertyAll(Color(0xffFB9E11).withOpacity(.7)),
    alignment: Alignment.center,
    elevation: WidgetStatePropertyAll(20),
    enableFeedback: true,
    animationDuration: Duration(milliseconds: 400),
    textStyle: WidgetStatePropertyAll(
      TextStyle(
        color: AppColors.gray[100],
        fontFamily: "Euclid Circular A",
        fontWeight: FontWeight.w500,
      ),
    ),

    mouseCursor: WidgetStateMouseCursor.resolveWith((states) {
      return SystemMouseCursors.click;
    }),
    padding: WidgetStatePropertyAll(
      EdgeInsets.symmetric(horizontal: Insets.med, vertical: 4),
    ),
    // textStyle:
  );

  ButtonStyle _lightElevatedButtonStyle() => ButtonStyle(
    backgroundColor: WidgetStatePropertyAll(Color(0xffFB9E11).withOpacity(.7)),
    alignment: Alignment.center,
    elevation: WidgetStatePropertyAll(20),
    enableFeedback: true,
    textStyle: WidgetStatePropertyAll(
      TextStyle(
        color: AppColors.gray[100],
        fontFamily: "Euclid Circular A",
        fontWeight: FontWeight.w500,
      ),
    ),
    overlayColor: WidgetStatePropertyAll(AppColors.gray[300]!),
    animationDuration: Duration(milliseconds: 400),
    mouseCursor: WidgetStateMouseCursor.resolveWith((states) {
      return SystemMouseCursors.click;
    }),
    padding: WidgetStatePropertyAll(
      EdgeInsets.symmetric(horizontal: Insets.med, vertical: 4),
    ),
    // textStyle:
  );

  ButtonStyle _lightOutlinedButtonStyle() => ButtonStyle(
    // backgroundColor: WidgetStatePropertyAll(Color(0xffFB9E11).withOpacity(.7)),
    alignment: Alignment.center,
    elevation: WidgetStatePropertyAll(20),
    enableFeedback: true,
    animationDuration: Duration(milliseconds: 400),
    textStyle: WidgetStatePropertyAll(
      TextStyle(
        color: AppColors.gray[800],
        fontFamily: "Euclid Circular A",
        fontWeight: FontWeight.w500,
      ),
    ),
    mouseCursor: WidgetStateMouseCursor.resolveWith((states) {
      return SystemMouseCursors.click;
    }),
    padding: WidgetStatePropertyAll(
      EdgeInsets.symmetric(horizontal: Insets.med, vertical: 4),
    ),
    // textStyle:
  );
}
