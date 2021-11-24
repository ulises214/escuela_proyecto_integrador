import 'package:flutter/material.dart';

import 'styles_icon_button.dart';

class MainFab extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  const MainFab({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StyledIconButton(
      icon: icon,
      onPressed: onPressed,
      size: 60.0,
    );
  }
}
