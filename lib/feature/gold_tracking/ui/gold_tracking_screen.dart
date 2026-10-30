import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sarraf/core/theming/style.dart';

class GoldTrackingScreen extends StatefulWidget {
  const GoldTrackingScreen({super.key});

  @override
  State<GoldTrackingScreen> createState() => _GoldTrackingScreenState();
}

class _GoldTrackingScreenState extends State<GoldTrackingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.auto_awesome_rounded, size: 100),
            Text(
              "coming-soon".tr(),
              style: TextStyles.font32PrimaryBold(context),
            ),
          ],
        ),
      ),
    );
  }
}
