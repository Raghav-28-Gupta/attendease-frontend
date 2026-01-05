import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/config/theme/app_theme.dart';
import 'core/config/router/app_router.dart';
import 'core/widgets/notification_banner.dart';

class AttendEaseApp extends ConsumerWidget {
  const AttendEaseApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return DynamicColorBuilder(
      builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
        return MaterialApp.router(
          title: 'AttendEase',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme(lightDynamic),
          // Dark theme will be added in later phase
          // darkTheme: AppTheme.darkTheme(darkDynamic),
          // themeMode: ThemeMode.system,
          routerConfig: router,
          builder: (context, child) {
            return Stack(
              children: [
                child ?? const SizedBox(),
                const NotificationBanner(),
              ],
            );
          },
        );
      },
    );
  }
}
