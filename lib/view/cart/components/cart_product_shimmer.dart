import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tr_store/core/app_components/app_shimmers.dart';

class CartProductShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 5,
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(top: 5.h),
              child: Appshimmer(
                width: double.infinity,
                height: 100.h,
                borderRadius: 10.r,
              ),
            ));
  }
}
