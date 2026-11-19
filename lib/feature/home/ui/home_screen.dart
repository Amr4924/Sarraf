import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:sarraf/core/helpers/spacing.dart';
import 'package:sarraf/feature/home/ui/widgets/custom_home_bar.dart';
import 'package:sarraf/feature/home/ui/widgets/field_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 24.w),
            child: Column(
              children: [
                const CustomHomeBar(),
                verticalSpacing(20),
                const FieldContainer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
