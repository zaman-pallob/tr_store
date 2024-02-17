// ignore_for_file: must_be_immutable

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tr_store/core/app_components/app_colors.dart';

import '../../../core/app_components/app_shimmers.dart';
import '../../../core/common_widgets/cached_image.dart';
import '../../../providers/product_details/product_detailsprovider.dart';

class ProductSlider extends StatefulWidget {
  @override
  State<ProductSlider> createState() => _ProductSliderState();
}

class _ProductSliderState extends State<ProductSlider> {
  int currentSlider = 0;
  @override
  Widget build(BuildContext context) {
    return Consumer<ProductDetailsProvider>(
      builder: (context, provider, child) {
        if (provider.images.isNotEmpty) {
          return Stack(
            alignment: Alignment.bottomCenter,
            children: [
              CarouselSlider(
                  options: CarouselOptions(
                      aspectRatio: (345.w / 340.h),
                      viewportFraction: 1,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 5),
                      autoPlayAnimationDuration: Duration(milliseconds: 1000),
                      autoPlayCurve: Curves.easeInCubic,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                      onPageChanged: (currentSlider, reason) {
                        setState(() {
                          this.currentSlider = currentSlider;
                        });
                      }),
                  items: provider.images
                      .map((imageUrl) => Builder(
                            builder: (context) {
                              return Container(
                                  width: 345.w,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppColors.primary,
                                          width: 1.w)),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10.r),
                                      child: CachedImage(
                                          boxFit: BoxFit.fill, url: imageUrl)));
                            },
                          ))
                      .toList()),
              Padding(
                padding: EdgeInsets.only(bottom: 15.h),
                child: smallImageRow(provider),
              )
            ],
          );
        } else {
          return Appshimmer(height: 340.h, width: 345.w);
        }
      },
    );
  }

  Widget smallImageRow(ProductDetailsProvider provider) {
    return Container(
        width: 345.w,
        height: 80.h,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < provider.images.length; i++)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 7.w),
                  child: Container(
                      width: 45.w,
                      height: 45.h,
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: AppColors.primary, width: 1.w),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: CachedImage(
                          borderRadius: 10.r,
                          boxFit: BoxFit.fill,
                          url: provider.images[i])),
                )
            ],
          ),
        ));
  }
}
