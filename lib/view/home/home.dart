import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tr_store/core/common_widgets/product_grid_shimmer.dart';
import 'package:tr_store/providers/home/home_provider.dart';
import 'package:tr_store/view/home/components/product_card.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<HomeProvider>(builder: (context, provider, child) {
      if (provider.hasProgress.value) {
        return ProductGridShimmer();
      } else {
        return GridView.builder(
          itemCount: provider.products.length,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10.h,
              childAspectRatio: (160.w / 255.h),
              crossAxisSpacing: 10.w),
          itemBuilder: (context, index) {
            var ob = provider.products[index];
            return ProductCard(
                onTapAdd: () {
                  provider.addProduct(index);
                },
                onTapBuy: () {},
                name: ob.title ?? "",
                price: ob.userId.toString(),
                imageUrl: ob.image ?? "",
                productId: ob.id.toString());
          },
        );
      }
    }));
  }
}
