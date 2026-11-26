import 'package:easy_localization/easy_localization.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarraf/core/Network/ap_currencyi_rate_manager.dart';
import 'package:sarraf/core/Network/api_gold_managment.dart';
import 'package:sarraf/core/routing/app_router.dart';
import 'package:sarraf/feature/gold/data/services/gold_services.dart';
import 'package:sarraf/feature/gold/logic/gold_ounce/cubit/gold_ounce_cubit.dart';
import 'package:sarraf/feature/gold/logic/operations/cubit/operation_gold_cubit.dart';
import 'package:sarraf/feature/home/data/services/home_services.dart';
import 'package:sarraf/feature/home/logic/currency_rates/cubit/currency_rate_cubit.dart';
import 'package:sarraf/feature/home/logic/operation/cubit/operation_cubit.dart';
import 'package:sarraf/feature/settings/logic/cubit/theme_cubit.dart';
import 'package:sarraf/sarraf_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized(
    assetLoader: RootBundleAssetLoader(
      path: 'assets/translations',
      supportedLocales: [Locale('en', 'US'), Locale('ar', 'EG')],
    ),
  );

  runApp(
    EasyLocalization(
      fallbackLocale: Locale('en', 'US'),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ThemeCubit()),
          BlocProvider(create: (context) => OperationsGoldCubit()),
          BlocProvider(
            create: (context) =>
                GoldOunceCubit(GoldServices(ApiGoldManagment())),
          ),
          BlocProvider(
            create: (context) =>
                CurrencyRatesCubit(HomeServices(ApiCurrencyRateManager())),
          ),
          BlocProvider(create: (context) => OperationCubit()),
        ],
        child: SarrafApp(appRoute: AppRouter()),
      ),
    ),
  );
}
