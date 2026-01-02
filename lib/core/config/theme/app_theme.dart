import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_semantic_colors.dart';

/// Material Design 3 Theme Configuration
///
/// Uses dynamic color on supported platforms (Android 12+) with fallback
/// to seed color. Integrates SemanticColors extension for attendance status.
class AppTheme {
  AppTheme._();

  // Brand seed color (fallback when dynamic color unavailable)
  static const Color _seedColor = Color(0xFF007BFF);

  // ─────────────────────────────────────────────────────────────────────────────
  // M3 SHAPE TOKENS
  // ─────────────────────────────────────────────────────────────────────────────

  static const double shapeExtraSmall = 4;
  static const double shapeSmall = 8;
  static const double shapeMedium = 12;
  static const double shapeLarge = 16;
  static const double shapeExtraLarge = 28;

  // ─────────────────────────────────────────────────────────────────────────────
  // COLOR SCHEMES
  // ─────────────────────────────────────────────────────────────────────────────

  /// Generate light color scheme (uses dynamic if provided)
  static ColorScheme lightScheme([ColorScheme? dynamicScheme]) {
    return dynamicScheme ??
        ColorScheme.fromSeed(
          seedColor: _seedColor,
          brightness: Brightness.light,
        );
  }

  /// Generate dark color scheme (uses dynamic if provided)
  static ColorScheme darkScheme([ColorScheme? dynamicScheme]) {
    return dynamicScheme ??
        ColorScheme.fromSeed(
          seedColor: _seedColor,
          brightness: Brightness.dark,
        );
  }

  // ─────────────────────────────────────────────────────────────────────────────
  // THEME DATA
  // ─────────────────────────────────────────────────────────────────────────────

  /// Light theme (primary theme)
  static ThemeData lightTheme([ColorScheme? dynamicScheme]) {
    final scheme = lightScheme(dynamicScheme);
    return _buildTheme(scheme);
  }

  /// Dark theme (for future use)
  static ThemeData darkTheme([ColorScheme? dynamicScheme]) {
    final scheme = darkScheme(dynamicScheme);
    return _buildTheme(scheme);
  }

  /// Build theme from color scheme
  static ThemeData _buildTheme(ColorScheme scheme) {
    final textTheme = GoogleFonts.interTextTheme();

    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      textTheme: textTheme,
      fontFamily: GoogleFonts.inter().fontFamily,

      // ─────────────────────────────────────────────────────────────────────────
      // EXTENSIONS
      // ─────────────────────────────────────────────────────────────────────────

      extensions: [
        SemanticColors.fromScheme(scheme),
      ],

      // ─────────────────────────────────────────────────────────────────────────
      // SCAFFOLD
      // ─────────────────────────────────────────────────────────────────────────

      scaffoldBackgroundColor: scheme.surface,

      // ─────────────────────────────────────────────────────────────────────────
      // APP BAR - M3 surface with scroll elevation
      // ─────────────────────────────────────────────────────────────────────────

      appBarTheme: AppBarTheme(
        backgroundColor: scheme.surface,
        foregroundColor: scheme.onSurface,
        elevation: 0,
        scrolledUnderElevation: 3,
        surfaceTintColor: scheme.surfaceTint,
        centerTitle: true,
        titleTextStyle: textTheme.titleLarge?.copyWith(
          color: scheme.onSurface,
          fontWeight: FontWeight.w600,
        ),
      ),

      // ─────────────────────────────────────────────────────────────────────────
      // CARDS - M3 tonal elevation (no shadow, color tint)
      // ─────────────────────────────────────────────────────────────────────────

      cardTheme: CardThemeData(
        color: scheme.surfaceContainerLow,
        elevation: 0,
        surfaceTintColor: scheme.surfaceTint,
        margin: const EdgeInsets.all(8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(shapeMedium),
        ),
      ),

      // ─────────────────────────────────────────────────────────────────────────
      // BUTTONS - M3 button variants
      // ─────────────────────────────────────────────────────────────────────────

      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          minimumSize: const Size(48, 48),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(shapeSmall),
          ),
        ),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(48, 48),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(shapeSmall),
          ),
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size(48, 48),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(shapeSmall),
          ),
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          minimumSize: const Size(48, 48),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(shapeSmall),
          ),
        ),
      ),

      // ─────────────────────────────────────────────────────────────────────────
      // FAB - M3 tertiary container
      // ─────────────────────────────────────────────────────────────────────────

      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: scheme.primaryContainer,
        foregroundColor: scheme.onPrimaryContainer,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(shapeLarge),
        ),
      ),

      // ─────────────────────────────────────────────────────────────────────────
      // INPUT - M3 filled text field
      // ─────────────────────────────────────────────────────────────────────────

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: scheme.surfaceContainerHighest,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(shapeExtraSmall),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(shapeExtraSmall),
          borderSide: BorderSide(color: scheme.outline, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(shapeExtraSmall),
          borderSide: BorderSide(color: scheme.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(shapeExtraSmall),
          borderSide: BorderSide(color: scheme.error, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(shapeExtraSmall),
          borderSide: BorderSide(color: scheme.error, width: 2),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),

      // ─────────────────────────────────────────────────────────────────────────
      // CHIPS - M3 chip styling
      // ─────────────────────────────────────────────────────────────────────────

      chipTheme: ChipThemeData(
        backgroundColor: scheme.surfaceContainerLow,
        labelStyle: textTheme.labelLarge,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(shapeSmall),
        ),
        side: BorderSide.none,
      ),

      // ─────────────────────────────────────────────────────────────────────────
      // DIALOGS - M3 extra-large shape
      // ─────────────────────────────────────────────────────────────────────────

      dialogTheme: DialogThemeData(
        backgroundColor: scheme.surfaceContainerHigh,
        elevation: 0,
        surfaceTintColor: scheme.surfaceTint,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(shapeExtraLarge),
        ),
      ),

      // ─────────────────────────────────────────────────────────────────────────
      // BOTTOM SHEET - M3 styling
      // ─────────────────────────────────────────────────────────────────────────

      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: scheme.surfaceContainerLow,
        surfaceTintColor: scheme.surfaceTint,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
        ),
      ),

      // ─────────────────────────────────────────────────────────────────────────
      // NAVIGATION BAR - M3 styling
      // ─────────────────────────────────────────────────────────────────────────

      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: scheme.surfaceContainer,
        indicatorColor: scheme.secondaryContainer,
        labelTextStyle: WidgetStateProperty.all(textTheme.labelMedium),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return IconThemeData(color: scheme.onSecondaryContainer);
          }
          return IconThemeData(color: scheme.onSurfaceVariant);
        }),
      ),

      // ─────────────────────────────────────────────────────────────────────────
      // BOTTOM NAVIGATION (legacy fallback)
      // ─────────────────────────────────────────────────────────────────────────

      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: scheme.surfaceContainer,
        selectedItemColor: scheme.primary,
        unselectedItemColor: scheme.onSurfaceVariant,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
      ),

      // ─────────────────────────────────────────────────────────────────────────
      // DIVIDER
      // ─────────────────────────────────────────────────────────────────────────

      dividerTheme: DividerThemeData(
        color: scheme.outlineVariant,
        thickness: 1,
      ),

      // ─────────────────────────────────────────────────────────────────────────
      // LIST TILE
      // ─────────────────────────────────────────────────────────────────────────

      listTileTheme: ListTileThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(shapeSmall),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      ),

      // ─────────────────────────────────────────────────────────────────────────
      // SNACKBAR
      // ─────────────────────────────────────────────────────────────────────────

      snackBarTheme: SnackBarThemeData(
        backgroundColor: scheme.inverseSurface,
        contentTextStyle: textTheme.bodyMedium?.copyWith(
          color: scheme.onInverseSurface,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(shapeSmall),
        ),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
