// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tr_store/core/app_components/app_colors.dart';

class Appshimmer extends StatelessWidget {
  double? width, height, borderRadius;

  Appshimmer({this.width, this.height, this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
              color: AppColors.secondary,
              borderRadius: BorderRadius.circular(borderRadius ?? 0)),
        ),
        baseColor: AppColors.ash,
        highlightColor: AppColors.cyan1);
  }
}
