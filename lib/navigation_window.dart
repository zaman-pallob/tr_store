import 'package:flutter/material.dart';

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
      body: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: GlobalVariable.navigationRouter,
        onGenerateRoute: CustomRouter.onGenerateRoute,
        initialRoute: AppRoutes.home,
      ),
    );
  }
}
