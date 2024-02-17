import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tr_store/core/app_components/app_colors.dart';
import 'package:tr_store/core/app_components/app_string.dart';
import 'package:tr_store/providers/product_details/product_detailsprovider.dart';

class ProductPrice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProductDetailsProvider>(
      builder: (context, value, child) {
        return Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.5.h),
                  child: Text("${AppString.price} :",
                      style: TextStyle(
                          fontSize: 15.sp, fontWeight: FontWeight.bold))),
              SizedBox(width: 5.w),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.5.h),
                  child: Text("${value.price}\$",
                      style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.lightgreen))),
            ],
          ),
        );
      },
    );
  }
}
