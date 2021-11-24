import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'src/app.dart';
import 'src/on_boarding/on_boarding.controller.dart';
import 'src/on_boarding/on_boarding.service.dart';
import 'src/routes.controller.dart';
import 'src/shared/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final onBoardingService = OnBoardingService();
  await onBoardingService.init();

  final onBoardingController = OnBoardingController(onBoardingService);
  await onBoardingController.init();
  final routeController = RouteController();
  runApp(MyApp(
    onBoardingController: onBoardingController,
    routeController: routeController,
  ));

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: kTokenScaffoldColor,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
}
