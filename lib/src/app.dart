import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home/home.screen.dart';
import 'on_boarding/on_boarding.controller.dart';
import 'on_boarding/on_boarding.screen.dart';
import 'product_detail/product_detail.screen.dart';
import 'routes.controller.dart';
import 'sample_feature/sample_item_details_view.dart';
import 'shared/theme/theme.dart';

class MyApp extends StatelessWidget {
  final OnBoardingController onBoardingController;
  final RouteController routeController;
  const MyApp({
    required this.onBoardingController,
    required this.routeController,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: onBoardingController),
        ChangeNotifierProvider.value(value: routeController),
      ],
      child: MaterialApp(
        navigatorKey: routeController.navigatorKey,
        debugShowCheckedModeBanner: false,
        restorationScopeId: 'app',
        title: 'Delivery',
        theme: appTheme,
        initialRoute: onBoardingController.isFirstTime
            ? OnBoardingScreen.routeName
            : HomeScreen.routeName,
        onGenerateRoute: (RouteSettings routeSettings) {
          return CupertinoPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) {
              switch (routeSettings.name) {
                case SampleItemDetailsView.routeName:
                  return const SampleItemDetailsView();
                case OnBoardingScreen.routeName:
                  return const OnBoardingScreen();
                case HomeScreen.routeName:
                  return const HomeScreen();
                case ProductDetailScreen.routeName:
                  return const ProductDetailScreen();
                default:
                  return const HomeScreen();
              }
            },
          );
        },
      ),
    );
  }
}
