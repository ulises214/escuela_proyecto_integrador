import 'package:flutter/material.dart';

import 'on_boarding.controller.dart';
import 'widgets/on_boarding_fab.dart';
import 'widgets/on_boarding_top.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: OnBoardingFab(_onNext),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            flex: 7,
            child: OnBoardingTop(
              pageController: pageController,
              onChange: _onPageChange,
            ),
          ),
          const Expanded(
            flex: 2,
            child: SizedBox.shrink(),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0, keepPage: true);
  }

  void _onNext() {
    final controller = OnBoardingController.read(context);
    if (!controller.isLastStep) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOutCubic,
      );
    }
    controller.nextStep();
  }

  void _onPageChange(int currentPage) {
    OnBoardingController.read(context).toStep(currentPage);
  }
}
