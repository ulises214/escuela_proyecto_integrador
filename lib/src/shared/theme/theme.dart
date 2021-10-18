import 'package:flutter/material.dart';

import 'tokens.dart';

final appTheme = _baseTheme.copyWith(
  scaffoldBackgroundColor: kTokenScaffoldColor,
  iconTheme: _baseTheme.iconTheme.copyWith(color: kTokenIconColor),
  cardColor: kTokenCardColor,
  primaryColor: kTokenPrimaryColor,
  textTheme:
      _baseTheme.textTheme.copyWith().apply(fontFamily: kTokenFontPoppins),
);
final _baseTheme = ThemeData.light();
