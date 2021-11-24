import 'package:flutter/material.dart';

import '../../home/home.screen.dart';
import '../../routes.controller.dart';
import '../../shared/widgets/atoms/styled_text_button.dart';
import '../on_boarding.controller.dart';

class OnBoardingSkipButton extends StatelessWidget {
  const OnBoardingSkipButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.of(context);
    return StyledTextButton.normal(
      'Saltar',
      onPressed: () async {
        await controller.finishOnBoarding();
        RouteController.read(context).toAndReplace(HomeScreen.routeName);
      },
    );
  }
}
