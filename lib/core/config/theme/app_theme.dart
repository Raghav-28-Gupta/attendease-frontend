import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_semantic_colors.dart';

/// Material Design 3 Theme Configuration - Warm Earth Theme
///
/// A warm, natural color palette inspired by earthy tones:
/// - Primary: Sage Green (0xFF608074) - Trust & Growth
/// - Secondary: Coral (0xFFDE493C) - Energy & Action
/// - Tertiary: Gold (0xFFC8A05C) - Achievement & Success
class AppTheme {
  AppTheme._();

  // ─────────────────────────────────────────────────────────────────────────────
  // WARM EARTH COLOR PALETTE
  // ─────────────────────────────────────────────────────────────────────────────

  /// Sage Green - Primary seed color (Trust, Growth, Education)
  static const Color seedColor = Color(0xFF608074);

  /// Coral - Secondary accent (Energy, Action, Alerts)
  static const Color secondaryColor = Color(0xFFDE493C);

  /// Gold - Tertiary accent (Achievement, Success, Highlights)
  static const Color tertiaryColor = Color(0xFFC8A05C);

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

  /// Generate light color scheme with Warm Earth palette
  static ColorScheme lightScheme([ColorScheme? dynamicScheme]) {
    // If dynamic color is available, use it; otherwise use our custom palette
    if (dynamicScheme != null) {
      return dynamicScheme;
    }

    return ColorScheme.fromSeed(
      seedColor: seedColor,
      brightness: Brightness.light,
      // Override secondary and tertiary for our Warm Earth palette
      secondary: secondaryColor,
      tertiary: tertiaryColor,
    );
  }

  /// Generate dark color scheme with Warm Earth palette
  static ColorScheme darkScheme([ColorScheme? dynamicScheme]) {
    if (dynamicScheme != null) {
      return dynamicScheme;
    }

    return ColorScheme.fromSeed(
      seedColor: seedColor,
      brightness: Brightness.dark,
      secondary: secondaryColor,
      tertiary: tertiaryColor,
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

  /// Dark theme
  static ThemeData darkTheme([ColorScheme? dynamicScheme]) {
    final scheme = darkScheme(dynamicScheme);
    return _buildTheme(scheme);
  }

  /// Build theme from color scheme
  static ThemeData _buildTheme(ColorScheme scheme) {
    // Use Outfit for a modern, clean look (falls back to Inter)
    final textTheme = GoogleFonts.outfitTextTheme();

    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      textTheme: textTheme,
      fontFamily: GoogleFonts.outfit().fontFamily,

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
        scrolledUnderElevation: 2,
        surfaceTintColor: scheme.surfaceTint,
        centerTitle: false, // Left-aligned for modern feel
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
        clipBehavior: Clip.antiAlias,
        margin: EdgeInsets.zero,
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
      // FAB - M3 tertiary container for prominent actions
      // ─────────────────────────────────────────────────────────────────────────

      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: scheme.tertiaryContainer,
        foregroundColor: scheme.onTertiaryContainer,
        elevation: 0,
        highlightElevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(shapeLarge),
        ),
        extendedTextStyle: textTheme.labelLarge?.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),

      // ─────────────────────────────────────────────────────────────────────────
      // INPUT - M3 filled text field
      // ─────────────────────────────────────────────────────────────────────────

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: scheme.surfaceContainerHighest,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(shapeSmall),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(shapeSmall),
          borderSide: BorderSide(color: scheme.outline, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(shapeSmall),
          borderSide: BorderSide(color: scheme.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(shapeSmall),
          borderSide: BorderSide(color: scheme.error, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(shapeSmall),
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
      // BOTTOM SHEET - M3 styling with drag handle
      // ─────────────────────────────────────────────────────────────────────────

      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: scheme.surfaceContainerLow,
        surfaceTintColor: scheme.surfaceTint,
        showDragHandle: true,
        dragHandleColor: scheme.onSurfaceVariant.withValues(alpha: 0.4),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
        ),
      ),

      // ─────────────────────────────────────────────────────────────────────────
      // NAVIGATION BAR - M3 styling
      // ─────────────────────────────────────────────────────────────────────────

      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: scheme.surfaceContainer,
        indicatorColor: scheme.primaryContainer,
        labelTextStyle: WidgetStateProperty.all(textTheme.labelMedium),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return IconThemeData(color: scheme.onPrimaryContainer);
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
          borderRadius: BorderRadius.circular(shapeMedium),
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

      // ─────────────────────────────────────────────────────────────────────────
      // PROGRESS INDICATORS - Use tertiary for accents
      // ─────────────────────────────────────────────────────────────────────────

      progressIndicatorTheme: ProgressIndicatorThemeData(
        linearTrackColor: scheme.surfaceContainerHighest,
        circularTrackColor: scheme.surfaceContainerHighest,
      ),
    );
  }
}
