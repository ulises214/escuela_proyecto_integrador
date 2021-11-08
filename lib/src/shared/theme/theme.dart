import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

part './colors.dart';
part './text_theme.dart';
part './tokens.dart';

final appTheme = _baseTheme.copyWith(
  scaffoldBackgroundColor: kTokenScaffoldColor,
  iconTheme: _baseTheme.iconTheme.copyWith(color: kTokenIconColor),
  cardColor: kTokenCardColor,
  primaryColor: kTokenPrimaryColor,
);
final _baseTheme = ThemeData.light();
