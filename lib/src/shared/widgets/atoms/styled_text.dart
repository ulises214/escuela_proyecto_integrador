import 'package:flutter/material.dart';

import '../../theme/theme.dart';

class StyledText extends StatelessWidget {
  final Color? color;
  final bool? bold;
  final bool? italic;
  final double fontSize;
  final String data;
  final TextStyle style;
  final TextAlign? textAlign;
  StyledText.normal(
    this.data, {
    Key? key,
    this.bold,
    this.italic,
    this.textAlign,
    this.color = kTokenPrimaryTextColor,
  })  : style = kTextStylePopins,
        fontSize = 16,
        super(key: key);
  StyledText.presentationTitle(
    this.data, {
    Key? key,
    this.bold,
    this.italic,
    this.textAlign,
    this.color = kTokenSecondaryTextColor,
  })  : style = kTextStyleAndada,
        fontSize = 42,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textAlign: textAlign,
      style: style.copyWith(
        color: color,
        fontSize: fontSize,
        fontWeight: bold == true ? FontWeight.bold : FontWeight.normal,
        fontStyle: italic == true ? FontStyle.italic : FontStyle.normal,
      ),
    );
  }
}
