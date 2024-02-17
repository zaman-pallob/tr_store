// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tr_store/core/app_components/app_string.dart';

import '../../../core/app_components/app_colors.dart';
import '../../../core/common_widgets/cached_image.dart';

class ProductCard extends StatelessWidget {
  String name;
  String imageUrl;
  String price;
  String productId;
  Function onTapBuy, onTapAdd;
  ProductCard(
      {required this.name,
      required this.price,
      required this.imageUrl,
      required this.productId,
      required this.onTapAdd,
      required this.onTapBuy});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.only(top: 10.h),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: AppColors.black.withOpacity(0.05),
              spreadRadius: 2,
              blurRadius: 2),
        ], borderRadius: BorderRadius.circular(10.r), color: AppColors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 1.w, color: AppColors.ash)),
              child: CachedImage(
                  url: imageUrl,
                  height: 130.h,
                  width: 148.w,
                  boxFit: BoxFit.fill),
            ),
            Container(
              padding: EdgeInsets.only(top: 10.h, left: 10.w, right: 10.w),
              alignment: Alignment.centerLeft,
              child: Text(
                "$price \$",
                style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: AppColors.lightgreen),
              ),
            ),
            Container(
                width: 148.w,
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: Text(name,
                    style: TextStyle(fontSize: 13.sp),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  button(
                      title: AppString.buy,
                      onTap: () {
                        onTapBuy();
                      }),
                  button(
                      title: AppString.addcart,
                      onTap: () {
                        onTapAdd();
                      })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget button({required String title, required Function onTap}) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        width: 70.w,
        height: 30.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.r),
            border: Border.all(width: 1.w, color: AppColors.primary)),
        child: Text(
          title,
          style: TextStyle(fontSize: 9.sp),
        ),
      ),
    );
  }
}
