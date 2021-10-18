import 'package:flutter/material.dart';

import '../../theme/tokens.dart';
import 'styled_text.dart';

class StyledTextButton extends StatelessWidget {
  final String data;
  final Color? color;
  final VoidCallback? onPressed;
  const StyledTextButton.normal(
    this.data, {
    Key? key,
    this.onPressed,
  })  : color = kTokenOffTextColor,
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: StyledText.normal(
        data,
        color: color,
      ),
    );
  }
}
