import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tr_store/core/app_components/app_colors.dart';
import 'package:tr_store/providers/cart/cart_provider.dart';
import 'package:tr_store/view/cart/components/cart_item.dart';
import 'package:tr_store/view/cart/components/cart_product_shimmer.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<CartProvider>(
        builder: (context, provider, child) {
          if (provider.hasProgress.value) {
            return CartProductShimmer();
          } else {
            if (provider.cartProducts.isEmpty) {
              return Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.shopping_cart_checkout, size: 60.h),
                    SizedBox(height: 10.h),
                    Text(
                      "You haven't added any product on the cart",
                      style:
                          TextStyle(color: AppColors.lightred, fontSize: 14.sp),
                    ),
                  ],
                ),
              );
            } else {
              return ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                itemCount: provider.cartProducts.length,
                itemBuilder: (context, index) {
                  var ob = provider.cartProducts[index];
                  return Padding(
                    padding: EdgeInsets.only(top: 6.h),
                    child: CartItem(
                        image: ob.image,
                        name: ob.name,
                        price: ob.price,
                        quantity: ob.quantity,
                        id: ob.id),
                  );
                },
              );
            }
          }
        },
      ),
    );
  }
}
