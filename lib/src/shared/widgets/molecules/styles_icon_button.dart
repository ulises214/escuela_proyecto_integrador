import 'package:flutter/material.dart';

import '../../theme/theme.dart';

class StyledIconButton extends StatelessWidget {
  final double size;
  final VoidCallback? onPressed;
  final IconData icon;
  const StyledIconButton({
    Key? key,
    required this.size,
    this.onPressed,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: kTokenMainGradient,
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
