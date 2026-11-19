import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:sarraf/core/helpers/spacing.dart';
import 'package:sarraf/core/theming/style.dart';
import 'package:sarraf/feature/gold/logic/operations/cubit/operation_gold_cubit.dart';
import 'package:sarraf/feature/gold/logic/operations/cubit/operation_gold_state.dart';

class GoldBar extends StatelessWidget {
  final void Function()? onTap;
  const GoldBar({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OperationsGoldCubit, OperatiopnGoldState>(
      builder: (context, state) {
        return Row(
          children: [
            CircleAvatar(
              radius: 22.r,
              backgroundColor: Theme.of(context).colorScheme.surface,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ),
            horizontalSpacing(12),
            Text("Gold prices", style: TextStyles.font24PrimaryBold(context)),
            horizontalSpacing(12),
            const Spacer(),
            GestureDetector(
              onTap: onTap,
              child: Container(
                width: 111.w,
                height: 44.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(999.r),
                  color: Theme.of(context).colorScheme.primaryContainer,
                ),
                child: Padding(
                  padding: EdgeInsetsGeometry.symmetric(
                    vertical: 6.h,
                    horizontal: 6.w,
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 16.r,
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        child: Text(
                          state.selectCurrency.symbol,
                          style: TextStyles.font14OnPrimaryBold(context),
                        ),
                      ),
                      horizontalSpacing(8),
                      Text(
                        state.selectCurrency.code,
                        style: TextStyles.font16TextPrimarySemiBold(context),
                      ),
                      Expanded(child: Icon(Icons.keyboard_arrow_down)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
