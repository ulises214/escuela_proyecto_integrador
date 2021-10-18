import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'on_boarding/on_boarding.controller.dart';
import 'on_boarding/on_boarding.screen.dart';
import 'sample_feature/sample_item_details_view.dart';
import 'sample_feature/sample_item_list_view.dart';
import 'shared/theme/theme.dart';

class MyApp extends StatelessWidget {
  final OnBoardingController onBoardingController;
  const MyApp({
    required this.onBoardingController,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: onBoardingController),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        restorationScopeId: 'app',
        title: 'Delivery',
        theme: appTheme,
        onGenerateRoute: (RouteSettings routeSettings) {
          return CupertinoPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) {
              switch (routeSettings.name) {
                case SampleItemDetailsView.routeName:
                  return const SampleItemDetailsView();
                case SampleItemListView.routeName:
                default:
                  return const _EntryPoint();
              }
            },
          );
        },
      ),
    );
  }
}

class _EntryPoint extends StatelessWidget {
  const _EntryPoint({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.of(context);
    if (controller.isFirstTime) return const OnBoardingScreen();
    return const Text('Text 2');
  }
}
