import 'package:flutter/material.dart';

import '../../theme/colors.dart';
import '../../theme/tokens.dart';

class MainFab extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  const MainFab({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.1, 0.3, 0.6, 0.95],
          colors: [
            kColorFulvous,
            kColorFawn,
            kColorFulvous,
            kColorFawn,
          ],
        ),
      ),
      child: Material(
        clipBehavior: Clip.antiAlias,
        shape: const CircleBorder(),
        elevation: 0,
        type: MaterialType.transparency,
        child: InkWell(
          onTap: onPressed,
          child: Center(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 150),
              child: Icon(
                icon,
                color: kTokenCardColor,
                key: ValueKey(icon),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
