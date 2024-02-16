import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tr_store/core/app_components/app_routes.dart';
import 'package:tr_store/core/app_components/app_string.dart';
import 'package:tr_store/providers/cart/cart_provider.dart';

import '../../providers/app_provider.dart';
import '../app_components/app_colors.dart';
import '../utils/global_variable.dart';

class CustomAppbar extends StatefulWidget implements PreferredSizeWidget {
  @override
  State<CustomAppbar> createState() => _CustomAppbarState();

  @override
  Size get preferredSize => Size(double.infinity, 100.h);
}

class _CustomAppbarState extends State<CustomAppbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100.h,
        padding: EdgeInsets.only(
            top: GlobalVariable.statusbarHeight, left: 15.w, right: 15.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8.r),
                bottomRight: Radius.circular(8.r)),
            color: AppColors.white,
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, -1),
                  spreadRadius: 1,
                  blurRadius: 2,
                  color: AppColors.black.withOpacity(0.4))
            ]),
        child: commonAppbar());
  }

  Widget commonAppbar() {
    return Consumer<AppProvider>(
        builder: (context, provider, child) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                provider.currentTitle == AppString.details
                    ? InkWell(
                        onTap: () {
                          Navigator.pop(GlobalVariable.context);
                        },
                        child: Icon(Icons.arrow_back_ios),
                      )
                    : SizedBox.shrink(),
                Text(provider.currentTitle,
                    style: TextStyle(
                        fontSize: 16.sp, fontWeight: FontWeight.w600)),
                cartButton(provider)
              ],
            ));
  }

  Widget cartButton(AppProvider provider) {
    return Row(
      children: [
        Consumer<CartProvider>(
            builder: (context, cartprovider, child) =>
                Stack(alignment: Alignment.topRight, children: [
                  Container(
                    height: 80.h,
                    width: 50.w,
                    child: GestureDetector(
                        onTap: () async {
                          Navigator.pushNamedAndRemoveUntil(
                              GlobalVariable.context,
                              AppRoutes.cart,
                              (route) => false);
                          provider.setCurrentOption(1, AppString.cart);
                        },
                        child: Icon(
                          Icons.shopping_cart_outlined,
                          color: AppColors.primary,
                        )),
                  ),
                  cartprovider.totalItems != 0
                      ? Padding(
                          padding: EdgeInsets.only(left: 10.w, top: 5.h),
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                color: AppColors.lightgreen,
                                shape: BoxShape.circle),
                            child: Text(cartprovider.totalItems.toString(),
                                style: TextStyle(
                                    fontSize: 10.sp, color: AppColors.white)),
                          ),
                        )
                      : SizedBox.shrink()
                ])),
        SizedBox(width: 15.w)
      ],
    );
  }
}
