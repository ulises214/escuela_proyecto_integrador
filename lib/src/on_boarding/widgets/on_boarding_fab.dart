import 'package:flutter/material.dart';

import '../../shared/widgets/molecules/main_fab.dart';
import '../on_boarding.controller.dart';
import 'on_boarding_bottom.dart';
import 'on_boarding_steps_view.dart';

class OnBoardingFab extends StatelessWidget {
  final VoidCallback onNext;
  const OnBoardingFab(
    this.onNext, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.of(context);
    return SizedBox(
      height: 60,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(left: kFloatingActionButtonMargin),
        child: Stack(
          alignment: Alignment.center,
          children: [
            const Positioned(
              left: 0,
              child: OnBoardingSkipButton(),
            ),
            const OnBoardingStepsView(),
            Positioned(
              right: 0,
              child: MainFab(
                onPressed: onNext,
                icon: controller.isLastStep
                    ? Icons.check
                    : Icons.keyboard_arrow_right_sharp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
