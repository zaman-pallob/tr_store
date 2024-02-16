// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tr_store/core/app_components/app_string.dart';

import '../../core/app_components/app_colors.dart';
import '../../core/app_components/app_routes.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1200));
    animation = Tween<double>(begin: 1.0, end: 0.0).animate(controller);
    controller.repeat();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      Future.delayed(Duration(milliseconds: 1000), () {
        Navigator.pushReplacementNamed(context, AppRoutes.navigationWindow);
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: double.infinity,
            height: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                tileMode: TileMode.mirror,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.cyan,
                  AppColors.splashColor.withOpacity(0.8),
                  AppColors.splashColor.withOpacity(0.6),
                  AppColors.cyan1,
                ],
              ),
            ),
            child: ScaleTransition(
              alignment: Alignment.center,
              scale: Tween(begin: 1.0, end: 10.0).animate(
                  CurvedAnimation(parent: controller, curve: Curves.linear)),
              child: FadeTransition(
                  opacity: animation,
                  child: Text(AppString.trstore,
                      style: TextStyle(
                          fontSize: 30.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.white,
                          fontStyle: FontStyle.italic))),
            )));
  }
}
