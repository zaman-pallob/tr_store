// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tr_store/core/app_components/app_colors.dart';

import '../../../core/common_widgets/cached_image.dart';
import '../../../providers/cart/cart_provider.dart';

class CartItem extends StatelessWidget {
  String name;
  String id;
  int quantity;
  String price;
  String image;
  CartItem(
      {required this.image,
      required this.name,
      required this.price,
      required this.id,
      required this.quantity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: AppColors.white,
                boxShadow: [
                  BoxShadow(
                      color: AppColors.black.withOpacity(0.05),
                      spreadRadius: 2,
                      blurRadius: 2)
                ]),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      dp(),
                      SizedBox(width: 10.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 180.w,
                            child: Text(name,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: TextStyle(fontSize: 14.sp)),
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            "Qty: $quantity",
                            style: TextStyle(
                                color: AppColors.lightgreen,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ],
                  ),
                  Consumer<CartProvider>(
                    builder: (context, value, child) => InkWell(
                        onTap: () {
                          value.removeItem(id);
                        },
                        child: Container(
                          width: 35.w,
                          height: 35.h,
                          child: Icon(Icons.delete_forever_outlined,
                              size: 30.h, color: AppColors.lightred),
                        )),
                  )
                ]),
          ),
        ],
      ),
    );
  }

  Widget dp() {
    return Container(
        width: 80.w,
        height: 80.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: AppColors.ash, width: 1.w)),
        child: CachedImage(
          url: image,
          height: 80.h,
          width: 80.w,
          borderRadius: 8.r,
          boxFit: BoxFit.fill,
        ));
  }
}
