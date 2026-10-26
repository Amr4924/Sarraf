import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:sarraf/core/routing/app_router.dart';
import 'package:sarraf/core/routing/routes.dart';
import 'package:sarraf/core/theming/app_theme.dart';
import 'package:sarraf/feature/settings/logic/cubit/theme_cubit.dart';
import 'package:sarraf/feature/settings/logic/cubit/theme_state.dart';

class SarrafApp extends StatelessWidget {
  final AppRouter appRoute;
  const SarrafApp({super.key, required this.appRoute});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilPlusInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            title: 'Sarraf App',
            darkTheme: AppTheme.darkTheme,
            theme: AppTheme.lightTheme,
            themeMode: state.themeMode,
            initialRoute: Routes.homeScreen,
            onGenerateRoute: appRoute.generateRoute,
          );
        },
      ),
    );
  }
}
