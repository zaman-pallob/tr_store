// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../providers/app_provider.dart';
import '../app_components/app_colors.dart';
import '../app_components/app_routes.dart';
import '../app_components/app_string.dart';
import '../utils/global_variable.dart';

class CustomBottomBar extends StatelessWidget {
  List<IconData> icons = [Icons.home_outlined, Icons.shopping_cart_outlined];
  List<String> routes = [AppRoutes.home, AppRoutes.cart];
  List<String> title = ["", AppString.cart];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      decoration: BoxDecoration(color: AppColors.white, boxShadow: [
        BoxShadow(
            color: AppColors.black.withOpacity(0.4),
            offset: Offset(0, 1),
            spreadRadius: 1,
            blurRadius: 2)
      ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [iconWidget(icons[0], 0), iconWidget(icons[1], 1)],
      ),
    );
  }

  Widget iconWidget(IconData iconData, int index) {
    return Consumer<AppProvider>(
      builder: (context, provider, child) => InkWell(
        onTap: () {
          Navigator.pushNamedAndRemoveUntil(
              GlobalVariable.context, routes[index], (route) => false);

          provider.setCurrentOption(index, title[index]);
        },
        child: Container(
          height: 70.h,
          width: 50.w,
          decoration: BoxDecoration(
              gradient: index == provider.currentOption
                  ? LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                          AppColors.primary.withOpacity(0.15),
                          AppColors.transparent
                        ])
                  : null),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  height: 4.h,
                  width: 50.w,
                  color: provider.currentOption == index
                      ? AppColors.primary
                      : AppColors.transparent),
              Icon(iconData,
                  color: provider.currentOption == index
                      ? AppColors.primary
                      : AppColors.black.withOpacity(0.6),
                  size: provider.currentOption == index ? 32.h : 23.h),
              SizedBox(height: 5.h)
            ],
          ),
        ),
      ),
    );
  }
}
