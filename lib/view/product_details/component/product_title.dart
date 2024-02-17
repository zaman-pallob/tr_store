import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../providers/product_details/product_detailsprovider.dart';

class ProductTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProductDetailsProvider>(
        builder: (context, provider, child) => Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
              child: Text(
                provider.name,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ));
  }
}
