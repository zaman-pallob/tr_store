import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:tr_store/core/app_components/app_colors.dart';
import 'package:tr_store/providers/home/home_provider.dart';
import 'package:tr_store/view/home/components/product_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<HomeProvider>(
          builder: (context, value, child) => GridView.builder(
                itemCount: value.products.length,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10.h,
                    childAspectRatio: (160.w / 255.h),
                    crossAxisSpacing: 10.w),
                itemBuilder: (context, index) {
                  var ob = value.products[index];
                  return ProductCard(
                      onTapAdd: () {
                        Fluttertoast.showToast(
                            msg: "Product added to cart",
                            gravity: ToastGravity.CENTER,
                            textColor: AppColors.white,
                            backgroundColor: AppColors.primary);
                      },
                      onTapBuy: () {},
                      name: ob.title ?? "",
                      price: ob.userId.toString(),
                      imageUrl: ob.image ?? "",
                      productId: ob.id.toString());
                },
              )),
    );
  }
}
