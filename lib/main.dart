import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tr_store/custom_router.dart';

import 'core/app_components/app_colors.dart';
import 'core/app_components/app_routes.dart';
import 'core/network/client.dart';
import 'core/utils/global_variable.dart';
import 'providers/app_provider.dart';
import 'view/splashscreen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MyClient.initializeDio();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppProvider()),
      ],
      child: ScreenUtilInit(
          minTextAdapt: true,
          designSize: Size(390, 844),
          builder: (context, child) => MaterialApp(
              debugShowCheckedModeBanner: false,
              navigatorKey: GlobalVariable.mainRouter,
              theme: ThemeData(
                  primaryColor: AppColors.primary,
                  appBarTheme: AppBarTheme(
                      systemOverlayStyle: SystemUiOverlayStyle(
                          statusBarColor: AppColors.transparent,
                          systemNavigationBarDividerColor:
                              AppColors.transparent,
                          statusBarBrightness: Brightness.light,
                          statusBarIconBrightness: Brightness.light))),
              initialRoute: AppRoutes.splashScreen,
              routes: {AppRoutes.splashScreen: (context) => SplashScreen()},
              onGenerateRoute: CustomRouter.onGenerateRoute)),
    );
  }
}
