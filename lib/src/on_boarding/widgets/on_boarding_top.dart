import 'package:flutter/material.dart';

import '../../shared/theme/theme.dart';
import '../../shared/widgets/atoms/styled_text.dart';
import '../on_boarding.controller.dart';
import 'on_boarding_top_background.dart';

class OnBoardingTop extends StatelessWidget {
  final PageController pageController;
  final void Function(int) onChange;
  const OnBoardingTop({
    Key? key,
    required this.onChange,
    required this.pageController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.of(context);
    return OnBoardingTopBackground(
      child: PageView.builder(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (_, i) => _TitleItem(item: controller.titleItems[i]),
        controller: pageController,
        onPageChanged: onChange,
        itemCount: controller.titleItems.length,
      ),
    );
  }
}

class _TitleItem extends StatelessWidget {
  final OnBoardingTitleItem item;
  const _TitleItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 60.0,
      ),
      child: Stack(
        children: [
          Positioned(
            top: kToolbarHeight + 20,
            left: 0,
            right: 0,
            height: 200,
            child: Image(
              image: AssetImage(item.imagePath),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 40,
            right: 40,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                StyledText.presentationTitle(item.title, bold: true),
                const SizedBox(height: 20),
                StyledText.normal(
                  item.description,
                  color: kTokenSecondaryTextColor,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
