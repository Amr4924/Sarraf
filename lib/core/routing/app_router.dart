import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:sarraf/core/routing/routes.dart';
import 'package:sarraf/feature/gold_tracking/ui/gold_tracking_screen.dart';
import 'package:sarraf/feature/home/ui/home_screen.dart';
import 'package:sarraf/feature/settings/ui/settings_screen.dart';

class AppRouter {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.settingsScreen:
        return MaterialPageRoute(builder: (_) => const SettingsScreen());
      case Routes.goldTrackingScreen:
        return MaterialPageRoute(builder: (_) => const GoldTrackingScreen());
      default:
        return MaterialPageRoute(
          builder: (_) {
            return Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("no-route-defined".tr(args: [settings.name ?? ""])),
                  ],
                ),
              ),
            );
          },
        );
    }
  }
}
