// ignore_for_file: close_sinks

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tr_store/models/cart_product.dart';

class GlobalVariable {
  static final GlobalKey<NavigatorState> mainRouter =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> navigationRouter =
      GlobalKey<NavigatorState>();
  static final BehaviorSubject<List<CartProduct>> cartStream =
      BehaviorSubject.seeded([]);

  static final BuildContext mainContext = mainRouter.currentContext!;

  static final BuildContext context = navigationRouter.currentContext!;
  static final scafoldKey = GlobalKey<ScaffoldState>();

  static double statusbarHeight =
      MediaQuery.of(mainRouter.currentContext!).padding.top;
}
