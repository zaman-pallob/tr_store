import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:tr_store/view/product_details/component/product_buttons.dart';
import 'package:tr_store/view/product_details/component/product_info.dart';
import 'package:tr_store/view/product_details/component/product_price.dart';
import 'package:tr_store/view/product_details/component/product_slider.dart';
import 'package:tr_store/view/product_details/component/product_title.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: [
          ProductSlider(),
          ProductTitle(),
          ProductPrice(),
          ProductInfo(),
          ProductButtons(),
          SizedBox(height: 40.h)
        ]),
      ),
    );
  }
}
