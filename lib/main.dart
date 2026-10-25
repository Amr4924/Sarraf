import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sarraf/core/routing/app_router.dart';
import 'package:sarraf/sarraf_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en', 'US'), Locale('ar', 'EG')],
      path:
          'assets/translations', // <-- change the path of the translation files
      fallbackLocale: Locale('en', 'US'),
      child: SarrafApp(appRoute: AppRouter()),
    ),
  );
}
