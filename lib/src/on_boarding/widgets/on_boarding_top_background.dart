import 'package:flutter/material.dart';

import '../../shared/theme/tokens.dart';

class OnBoardingTopBackground extends StatelessWidget {
  final Widget? child;
  const OnBoardingTopBackground({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.elliptical(80, 50),
        ),
        gradient: LinearGradient(
          tileMode: TileMode.decal,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.2, 1],
          colors: [
            kTokenScaffoldColor,
            kTokenSecondaryColor,
          ],
        ),
      ),
      child: child,
    );
  }
}
