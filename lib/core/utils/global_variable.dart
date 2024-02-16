import 'package:flutter/material.dart';

class GlobalVariable {
  static final GlobalKey<NavigatorState> mainRouter =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> navigationRouter =
      GlobalKey<NavigatorState>();

  static final BuildContext mainContext = mainRouter.currentContext!;

  static final BuildContext context = navigationRouter.currentContext!;
  static final scafoldKey = GlobalKey<ScaffoldState>();

  static double statusbarHeight =
      MediaQuery.of(mainRouter.currentContext!).padding.top;
}
