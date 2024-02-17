import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tr_store/core/app_components/app_colors.dart';
import 'package:tr_store/core/app_components/app_string.dart';
import 'package:tr_store/providers/product_details/product_detailsprovider.dart';

class ProductInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProductDetailsProvider>(
        builder: (context, provider, child) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
              child: ExpandableNotifier(
                child: Builder(builder: (context) {
                  ExpandableController? controller =
                      ExpandableController.of(context);
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.h),
                        child: Text(AppString.details,
                            style: TextStyle(
                                fontSize: 15.sp, fontWeight: FontWeight.bold)),
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.toggle();
                        },
                        child: Container(
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                width: double.infinity,
                                child: Expandable(
                                  collapsed: Text(provider.details,
                                      maxLines: 4,
                                      textAlign: TextAlign.justify,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(fontSize: 13.sp)),
                                  expanded: Text(provider.details,
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(fontSize: 13.sp)),
                                ),
                              ),
                              Text(
                                controller!.expanded
                                    ? "Show less"
                                    : "Show More..",
                                style: TextStyle(color: AppColors.blue_cobalt),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ));
  }
}
