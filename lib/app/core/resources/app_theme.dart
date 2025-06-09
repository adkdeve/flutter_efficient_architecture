import 'package:flutter/material.dart';
import 'resources.dart';

class AppThemeData {
  final _colors = AppColors();
  final _textTheme = AppTextTheme();

  ThemeData get light => ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        primaryColor: _colors.primary,
        scaffoldBackgroundColor: _colors.background,
        appBarTheme: AppBarTheme(
          surfaceTintColor: Colors.transparent,
          backgroundColor: _colors.background,
          foregroundColor: _colors.textPrimary,
          elevation: 0,
          centerTitle: true,
          titleTextStyle:
              _textTheme.titleLarge.copyWith(color: _colors.textPrimary),
        ),
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: _colors.primary,
          onPrimary: _colors.white,
          secondary: _colors.secondary,
          onSecondary: _colors.white,
          error: _colors.error,
          onError: _colors.white,
          surface: _colors.surface,
          onSurface: _colors.textPrimary,
        ),
        textTheme: TextTheme(
          // Display styles
          displayLarge:
              _textTheme.displayLarge.copyWith(color: _colors.textPrimary),
          displayMedium:
              _textTheme.displayMedium.copyWith(color: _colors.textPrimary),
          displaySmall:
              _textTheme.displaySmall.copyWith(color: _colors.textPrimary),

          // Headline styles
          headlineLarge:
              _textTheme.headlineLarge.copyWith(color: _colors.textPrimary),
          headlineMedium:
              _textTheme.headlineMedium.copyWith(color: _colors.textPrimary),
          headlineSmall:
              _textTheme.headlineSmall.copyWith(color: _colors.textPrimary),

          // Title styles
          titleLarge:
              _textTheme.titleLarge.copyWith(color: _colors.textPrimary),
          titleMedium:
              _textTheme.titleMedium.copyWith(color: _colors.textPrimary),
          titleSmall:
              _textTheme.titleSmall.copyWith(color: _colors.textPrimary),

          // Body styles
          bodyLarge: _textTheme.bodyLarge.copyWith(color: _colors.textPrimary),
          bodyMedium:
              _textTheme.bodyMedium.copyWith(color: _colors.textPrimary),
          bodySmall: _textTheme.bodySmall.copyWith(color: _colors.textPrimary),

          // Label styles
          labelLarge:
              _textTheme.labelLarge.copyWith(color: _colors.textPrimary),
          labelMedium:
              _textTheme.labelMedium.copyWith(color: _colors.textPrimary),
          labelSmall:
              _textTheme.labelSmall.copyWith(color: _colors.textPrimary),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: _colors.surface,
          labelStyle:
              _textTheme.labelMedium.copyWith(color: _colors.textSecondary),
          hintStyle:
              _textTheme.bodyMedium.copyWith(color: _colors.textSecondary),
          errorStyle: _textTheme.labelSmall.copyWith(color: _colors.error),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: _colors.inputBorder),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: _colors.inputBorder),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: _colors.primary),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: _colors.error),
          ),
          contentPadding: const EdgeInsets.all(16),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            textStyle: _textTheme.buttonLarge,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            textStyle: _textTheme.buttonMedium,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
        ),
        iconTheme: IconThemeData(
          color: _colors.textPrimary,
          size: 24,
        ),
        dividerTheme: DividerThemeData(
          color: _colors.divider,
          thickness: 1,
        ),
      );

  ThemeData get dark => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        primaryColor: _colors.primary,
        scaffoldBackgroundColor: _colors.darkBackground,
        appBarTheme: AppBarTheme(
          surfaceTintColor: Colors.transparent,
          backgroundColor: _colors.darkBackground,
          foregroundColor: _colors.darkText,
          elevation: 0,
          centerTitle: true,
          titleTextStyle:
              _textTheme.titleLarge.copyWith(color: _colors.darkText),
        ),
        colorScheme: ColorScheme(
          brightness: Brightness.dark,
          primary: _colors.primary,
          onPrimary: _colors.white,
          secondary: _colors.secondary,
          onSecondary: _colors.white,
          error: _colors.error,
          onError: _colors.white,
          surface: _colors.surface,
          onSurface: _colors.darkText,
        ),
        textTheme: TextTheme(
          // Display styles
          displayLarge:
              _textTheme.displayLarge.copyWith(color: _colors.darkText),
          displayMedium:
              _textTheme.displayMedium.copyWith(color: _colors.darkText),
          displaySmall:
              _textTheme.displaySmall.copyWith(color: _colors.darkText),

          // Headline styles
          headlineLarge:
              _textTheme.headlineLarge.copyWith(color: _colors.darkText),
          headlineMedium:
              _textTheme.headlineMedium.copyWith(color: _colors.darkText),
          headlineSmall:
              _textTheme.headlineSmall.copyWith(color: _colors.darkText),

          // Title styles
          titleLarge: _textTheme.titleLarge.copyWith(color: _colors.darkText),
          titleMedium: _textTheme.titleMedium.copyWith(color: _colors.darkText),
          titleSmall: _textTheme.titleSmall.copyWith(color: _colors.darkText),

          // Body styles
          bodyLarge: _textTheme.bodyLarge.copyWith(color: _colors.darkText),
          bodyMedium: _textTheme.bodyMedium.copyWith(color: _colors.darkText),
          bodySmall: _textTheme.bodySmall.copyWith(color: _colors.darkText),

          // Label styles
          labelLarge: _textTheme.labelLarge.copyWith(color: _colors.darkText),
          labelMedium: _textTheme.labelMedium.copyWith(color: _colors.darkText),
          labelSmall: _textTheme.labelSmall.copyWith(color: _colors.darkText),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: _colors.darkBackground,
          labelStyle:
              _textTheme.labelMedium.copyWith(color: _colors.textSecondary),
          hintStyle:
              _textTheme.bodyMedium.copyWith(color: _colors.textSecondary),
          errorStyle: _textTheme.labelSmall.copyWith(color: _colors.error),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: _colors.inputBorder),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: _colors.inputBorder),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: _colors.primary),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: _colors.error),
          ),
          contentPadding: const EdgeInsets.all(16),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            textStyle: _textTheme.buttonLarge,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            textStyle: _textTheme.buttonMedium,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
        ),
        iconTheme: IconThemeData(
          color: _colors.darkText,
          size: 24,
        ),
        dividerTheme: DividerThemeData(
          color: _colors.divider,
          thickness: 1,
        ),
      );
}
