// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../app_components/app_image.dart';

class CachedImage extends StatelessWidget {
  String? url;
  double? width, height;
  BoxFit? boxFit;
  String? placeHolder;
  CachedImage(
      {this.url, this.height, this.width, this.boxFit, this.placeHolder});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url ?? "",
      height: height,
      width: width,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: boxFit ?? BoxFit.contain,
          ),
        ),
      ),
      placeholder: (context, url) => Image(
        image: AssetImage(placeHolder ?? AppImage.placeholderSquire),
        fit: BoxFit.contain,
      ),
      errorWidget: (context, url, error) => Image(
        image: AssetImage(placeHolder ?? AppImage.placeholderSquire),
        fit: BoxFit.contain,
      ),
    );
  }
}
