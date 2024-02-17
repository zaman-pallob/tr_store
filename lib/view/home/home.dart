import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tr_store/core/app_components/app_string.dart';
import 'package:tr_store/core/common_widgets/product_grid_shimmer.dart';
import 'package:tr_store/providers/app_provider.dart';
import 'package:tr_store/providers/home/home_provider.dart';
import 'package:tr_store/view/home/components/product_card.dart';

import '../../core/app_components/app_routes.dart';
import '../../core/utils/global_variable.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late AppProvider appProvider;
  @override
  Widget build(BuildContext context) {
    appProvider = Provider.of<AppProvider>(context, listen: false);
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
                onViewDetails: () async {
                  appProvider.setCurrentTitle(AppString.details);
                  await Navigator.pushNamed(
                      GlobalVariable.context, AppRoutes.productDetails,
                      arguments: {"product_id": ob.id.toString()});
                  appProvider.setCurrentTitle(AppString.product);
                },
                onTapAdd: () {
                  provider.addProduct(index);
                },
                onTapBuy: () async {
                  provider.addProduct(index);
                  Navigator.pushNamedAndRemoveUntil(
                      GlobalVariable.context, AppRoutes.cart, (route) => false);
                  appProvider.setCurrentOption(1, AppString.cart);
                },
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
