import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:sarraf/core/helpers/spacing.dart';
import 'package:sarraf/core/models/currencies_model.dart';
import 'package:sarraf/core/theming/style.dart';
import 'package:sarraf/feature/gold/logic/gold_ounce/cubit/gold_ounce_cubit.dart';
import 'package:sarraf/feature/gold/logic/operations/cubit/operation_gold_cubit.dart';
import 'package:sarraf/feature/gold/ui/widgets/calculator.dart';
import 'package:sarraf/feature/gold/ui/widgets/gold_bar.dart';
import 'package:sarraf/feature/gold/ui/widgets/karat_list.dart';

class GoldTrackingScreen extends StatefulWidget {
  const GoldTrackingScreen({super.key});

  @override
  State<GoldTrackingScreen> createState() => _GoldTrackingScreenState();
}

class _GoldTrackingScreenState extends State<GoldTrackingScreen> {
  @override
  void initState() {
    super.initState();
    context.read<GoldOunceCubit>().getGoldOunce();
    context.read<OperationsGoldCubit>().reset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GoldBar(
                  onTap: () {
                    final selectCurrency = context.read<OperationsGoldCubit>();
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          padding: const EdgeInsets.all(16),
                          height: 300.h,
                          child: ListView.builder(
                            itemCount: currenciesList.length,
                            itemBuilder: (context, index) {
                              final currency = currenciesList[index];
                              return ListTile(
                                leading: CircleAvatar(
                                  child: Text(currency.symbol),
                                ),
                                title: Text(currency.code),
                                subtitle: Text(currency.nameCurrencies),
                                onTap: () {
                                  selectCurrency.selectCurrency(currency);
                                  Navigator.pop(context);
                                },
                              );
                            },
                          ),
                        );
                      },
                    );
                  },
                ),
                verticalSpacing(8),
                const Calculator(),
                verticalSpacing(14),
                Text(
                  "price-per-gram".tr(),
                  style: TextStyles.font15TextPrimarySemiBold(context),
                ),
                verticalSpacing(10),
                const KaratList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
