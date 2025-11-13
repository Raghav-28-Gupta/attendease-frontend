import 'package:flutter/material.dart';
import '../config/theme/app_colors.dart';

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
      duration: const Duration(milliseconds: 200),
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
                curve: Curves.easeOut,
              ),
            ),
            child: FadeTransition(
              opacity: _controller,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Label
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Text(
                        item.label,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    
                    // Button
                    FloatingActionButton(
                      heroTag: 'fab_$index',
                      mini: true,
                      backgroundColor: item.color,
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
        }).toList(),

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
  final Color color;
  final VoidCallback onPressed;

  FloatingActionMenuItem({
    required this.label,
    required this.icon,
    required this.color,
    required this.onPressed,
  });
}
