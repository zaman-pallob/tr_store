import 'package:flutter/material.dart';
import 'package:tr_store/core/common_widgets/custom_appbar.dart';

import 'core/app_components/app_routes.dart';
import 'core/utils/global_variable.dart';
import 'custom_router.dart';

class NavigationWindow extends StatefulWidget {
  const NavigationWindow({super.key});

  @override
  State<NavigationWindow> createState() => _NavigationWindowState();
}

class _NavigationWindowState extends State<NavigationWindow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: GlobalVariable.scafoldKey,
      appBar: CustomAppbar(),
      body: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: GlobalVariable.navigationRouter,
        onGenerateRoute: CustomRouter.onGenerateRoute,
        initialRoute: AppRoutes.home,
      ),
    );
  }
}
