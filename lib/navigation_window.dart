import 'package:flutter/material.dart';
import 'package:tr_store/core/app_database/app_database.dart';
import 'package:tr_store/core/common_widgets/custom_appbar.dart';
import 'package:tr_store/core/common_widgets/custom_bottombar.dart';
import 'package:tr_store/database/cart_products/my_cart_dao.dart';

import 'core/app_components/app_routes.dart';
import 'core/utils/global_variable.dart';
import 'custom_router.dart';

late MyCartDao cartDao;

class NavigationWindow extends StatefulWidget {
  const NavigationWindow({super.key});

  @override
  State<NavigationWindow> createState() => _NavigationWindowState();
}

class _NavigationWindowState extends State<NavigationWindow> {
  @override
  void initState() {
    super.initState();
    var db = AppDatabase();
    cartDao = MyCartDao(db);
    loadCartProducts();
  }

  loadCartProducts() async {
    GlobalVariable.cartStream.sink.add(await cartDao.getAllCartProducts());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      bottomNavigationBar: CustomBottomBar(),
      body: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: GlobalVariable.navigationRouter,
        onGenerateRoute: CustomRouter.onGenerateRoute,
        initialRoute: AppRoutes.home,
      ),
    );
  }
}
