// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tr_store/core/app_components/app_colors.dart';
import 'package:tr_store/core/app_components/app_string.dart';
import 'package:tr_store/providers/app_provider.dart';
import 'package:tr_store/providers/product_details/product_detailsprovider.dart';

import '../../../core/app_components/app_routes.dart';
import '../../../core/utils/global_variable.dart';

class ProductButtons extends StatelessWidget {
  late AppProvider appProvider;
  @override
  Widget build(BuildContext context) {
    appProvider = Provider.of<AppProvider>(context, listen: false);
    return Consumer<ProductDetailsProvider>(
      builder: (context, provider, child) {
        return Container(
          color: AppColors.transparent,
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(165.w, 50.h),
                    backgroundColor: AppColors.primary),
                onPressed: () {
                  provider.addProduct();

                  Navigator.pushNamedAndRemoveUntil(
                      GlobalVariable.context, AppRoutes.cart, (route) => false);
                  appProvider.setCurrentOption(1, AppString.cart);
                },
                child: Text(
                  AppString.buy,
                  style: TextStyle(color: AppColors.white),
                ),
              ),
              OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      fixedSize: Size(165.w, 50.h),
                      side: BorderSide(width: 1.w, color: AppColors.primary)),
                  onPressed: () {
                    provider.addProduct();
                  },
                  child: Text(
                    AppString.addcart,
                    style: TextStyle(color: AppColors.primary),
                  ))
            ],
          ),
        );
      },
    );
  }
}
