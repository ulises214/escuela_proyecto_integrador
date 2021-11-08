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
      spacing: 5.0,
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
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: isActive ? 24.0 : 8.0,
      height: 8.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        color: isActive ? kTokenPrimaryColor : kTokenOffTextColor,
        // shape: BoxShape.circle,
      ),
    );
    // return CircleAvatar(
    //   minRadius: 4,
    //   maxRadius: 4,
    //   backgroundColor: isActive ? kTokenPrimaryColor : kTokenOffTextColor,
    // );
  }
}
