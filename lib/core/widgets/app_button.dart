import 'package:flutter/material.dart';

/// M3-compliant button widget with all 5 button variants.
///
/// Use named constructors based on emphasis level:
/// - [AppButton.filled] - Highest emphasis (primary action)
/// - [AppButton.tonal] - Medium-high emphasis (secondary action)
/// - [AppButton.elevated] - Medium emphasis (lifted from surface)
/// - [AppButton.outlined] - Medium-low emphasis (outline only)
/// - [AppButton.text] - Lowest emphasis (subtle action)
///
/// Legacy constructor also supported for backward compatibility.
class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final IconData? icon;
  final double? width;
  final double? height;
  final _ButtonType _type;

  // Legacy properties (ignored in new API, used for backward compat)
  final bool _isOutlined;
  final Color? _backgroundColor;

  /// Legacy constructor for backward compatibility.
  /// Prefer using named constructors like [AppButton.filled] or [AppButton.outlined].
  const AppButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    bool isOutlined = false,
    Color? backgroundColor,
    Color? textColor, // Ignored - uses theme
    this.icon,
    this.width,
    this.height,
  })  : _type = _ButtonType.legacy,
        _isOutlined = isOutlined,
        _backgroundColor = backgroundColor;

  const AppButton._({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.icon,
    this.width,
    this.height,
    required _ButtonType type,
  })  : _type = type,
        _isOutlined = false,
        _backgroundColor = null;

  /// Filled button - highest emphasis
  const AppButton.filled({
    Key? key,
    required String text,
    VoidCallback? onPressed,
    bool isLoading = false,
    IconData? icon,
    double? width,
    double? height,
  }) : this._(
          key: key,
          text: text,
          onPressed: onPressed,
          isLoading: isLoading,
          icon: icon,
          width: width,
          height: height,
          type: _ButtonType.filled,
        );

  /// Tonal button - medium-high emphasis
  const AppButton.tonal({
    Key? key,
    required String text,
    VoidCallback? onPressed,
    bool isLoading = false,
    IconData? icon,
    double? width,
    double? height,
  }) : this._(
          key: key,
          text: text,
          onPressed: onPressed,
          isLoading: isLoading,
          icon: icon,
          width: width,
          height: height,
          type: _ButtonType.tonal,
        );

  /// Elevated button - medium emphasis
  const AppButton.elevated({
    Key? key,
    required String text,
    VoidCallback? onPressed,
    bool isLoading = false,
    IconData? icon,
    double? width,
    double? height,
  }) : this._(
          key: key,
          text: text,
          onPressed: onPressed,
          isLoading: isLoading,
          icon: icon,
          width: width,
          height: height,
          type: _ButtonType.elevated,
        );

  /// Outlined button - medium-low emphasis
  const AppButton.outlined({
    Key? key,
    required String text,
    VoidCallback? onPressed,
    bool isLoading = false,
    IconData? icon,
    double? width,
    double? height,
  }) : this._(
          key: key,
          text: text,
          onPressed: onPressed,
          isLoading: isLoading,
          icon: icon,
          width: width,
          height: height,
          type: _ButtonType.outlined,
        );

  /// Text button - lowest emphasis
  const AppButton.text({
    Key? key,
    required String text,
    VoidCallback? onPressed,
    bool isLoading = false,
    IconData? icon,
    double? width,
    double? height,
  }) : this._(
          key: key,
          text: text,
          onPressed: onPressed,
          isLoading: isLoading,
          icon: icon,
          width: width,
          height: height,
          type: _ButtonType.text,
        );

  @override
  Widget build(BuildContext context) {
    final child = _buildChild(context);
    final effectiveOnPressed = isLoading ? null : onPressed;

    // Determine effective type
    final effectiveType = _type == _ButtonType.legacy
        ? (_isOutlined ? _ButtonType.outlined : _ButtonType.filled)
        : _type;

    Widget button = switch (effectiveType) {
      _ButtonType.filled || _ButtonType.legacy => _backgroundColor != null
          ? FilledButton(
              onPressed: effectiveOnPressed,
              style: FilledButton.styleFrom(backgroundColor: _backgroundColor),
              child: child,
            )
          : FilledButton(
              onPressed: effectiveOnPressed,
              child: child,
            ),
      _ButtonType.tonal => FilledButton.tonal(
          onPressed: effectiveOnPressed,
          child: child,
        ),
      _ButtonType.elevated => ElevatedButton(
          onPressed: effectiveOnPressed,
          child: child,
        ),
      _ButtonType.outlined => OutlinedButton(
          onPressed: effectiveOnPressed,
          child: child,
        ),
      _ButtonType.text => TextButton(
          onPressed: effectiveOnPressed,
          child: child,
        ),
    };

    if (width != null || height != null) {
      button = SizedBox(
        width: width,
        height: height ?? 48,
        child: button,
      );
    }

    return button;
  }

  Widget _buildChild(BuildContext context) {
    final effectiveType = _type == _ButtonType.legacy
        ? (_isOutlined ? _ButtonType.outlined : _ButtonType.filled)
        : _type;

    if (isLoading) {
      return SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator.adaptive(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(
            effectiveType == _ButtonType.filled
                ? Theme.of(context).colorScheme.onPrimary
                : Theme.of(context).colorScheme.primary,
          ),
        ),
      );
    }

    if (icon != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18),
          const SizedBox(width: 8),
          Text(text),
        ],
      );
    }

    return Text(text);
  }
}

enum _ButtonType { filled, tonal, elevated, outlined, text, legacy }
