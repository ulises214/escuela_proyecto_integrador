import 'package:flutter/material.dart';

import '../../shared/theme/theme.dart';
import '../on_boarding.controller.dart';

class OnBoardingStepsView extends StatelessWidget {
  const OnBoardingStepsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.of(context);
    return Wrap(
      direction: Axis.horizontal,
      spacing: 15.0,
      children: List.generate(
        controller.titleItems.length,
        (i) => _Circle(
          isActive: i == controller.currentStep,
        ),
      ),
    );
  }
}

class _Circle extends StatelessWidget {
  final bool isActive;
  const _Circle({Key? key, required this.isActive}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      minRadius: 4,
      maxRadius: 4,
      backgroundColor: isActive ? kTokenPrimaryColor : kTokenOffTextColor,
    );
  }
}
