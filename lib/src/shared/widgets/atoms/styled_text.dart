import 'package:flutter/material.dart';

import '../../theme/tokens.dart';

class StyledText extends StatelessWidget {
  final Color? color;
  final String fontFamily;
  final bool? bold;
  final bool? italic;
  final double fontSize;
  final String data;
  const StyledText.normal(
    this.data, {
    Key? key,
    this.bold,
    this.italic,
    this.color = kTokenPrimaryTextColor,
  })  : fontFamily = kTokenFontPoppins,
        fontSize = 16,
        super(key: key);
  const StyledText.presentationTitle(
    this.data, {
    Key? key,
    this.bold,
    this.italic,
    this.color = kTokenSecondaryTextColor,
  })  : fontFamily = kTokenFontAndadaPro,
        fontSize = 42,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Text(
      data,
      style: textTheme.bodyText1?.copyWith(
        color: color,
        fontFamily: fontFamily,
        fontSize: fontSize,
        fontWeight: bold == true ? FontWeight.bold : FontWeight.normal,
        fontStyle: italic == true ? FontStyle.italic : FontStyle.normal,
      ),
    );
  }
}
