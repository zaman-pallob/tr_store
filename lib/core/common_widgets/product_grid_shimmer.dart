import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tr_store/core/app_components/app_shimmers.dart';

class ProductGridShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: 6,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10.h,
            childAspectRatio: (160.w / 255.h),
            crossAxisSpacing: 10.w),
        itemBuilder: (context, index) {
          return Appshimmer(
            width: 160.w,
            height: 255.h,
            borderRadius: 10.r,
          );
        });
  }
}
