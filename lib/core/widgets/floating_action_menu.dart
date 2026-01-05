import 'package:flutter/material.dart';
import '../config/theme/app_motion.dart';
import '../config/theme/app_spacing.dart';

/// M3-styled expandable FAB menu.
class FloatingActionMenu extends StatefulWidget {
  final List<FloatingActionMenuItem> items;

  const FloatingActionMenu({
    super.key,
    required this.items,
  });

  @override
  State<FloatingActionMenu> createState() => _FloatingActionMenuState();
}

class _FloatingActionMenuState extends State<FloatingActionMenu>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isOpen = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: AppMotion.medium2,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggle() {
    if (_isOpen) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
    setState(() => _isOpen = !_isOpen);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // Menu Items
        ...widget.items.asMap().entries.map((entry) {
          final index = entry.key;
          final item = entry.value;

          return ScaleTransition(
            scale: CurvedAnimation(
              parent: _controller,
              curve: Interval(
                0.0,
                1.0 - (index * 0.1),
                curve: AppMotion.emphasizedDecelerate,
              ),
            ),
            child: FadeTransition(
              opacity: _controller,
              child: Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.smd),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Label
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.smd,
                        vertical: AppSpacing.sm,
                      ),
                      decoration: BoxDecoration(
                        color: colorScheme.surfaceContainerHigh,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        item.label,
                        style: textTheme.labelLarge?.copyWith(
                          color: colorScheme.onSurface,
                        ),
                      ),
                    ),
                    const SizedBox(width: AppSpacing.smd),

                    // Button
                    FloatingActionButton.small(
                      heroTag: 'fab_$index',
                      backgroundColor:
                          item.color ?? colorScheme.primaryContainer,
                      foregroundColor: item.color != null
                          ? colorScheme.onPrimary
                          : colorScheme.onPrimaryContainer,
                      onPressed: () {
                        _toggle();
                        item.onPressed();
                      },
                      child: Icon(item.icon, size: 20),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),

        // Main Button
        FloatingActionButton(
          onPressed: _toggle,
          child: AnimatedIcon(
            icon: AnimatedIcons.menu_close,
            progress: _controller,
          ),
        ),
      ],
    );
  }
}

class FloatingActionMenuItem {
  final String label;
  final IconData icon;
  final Color? color;
  final VoidCallback onPressed;

  FloatingActionMenuItem({
    required this.label,
    required this.icon,
    this.color,
    required this.onPressed,
  });
}
