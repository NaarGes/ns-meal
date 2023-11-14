import 'package:flutter/material.dart';
import 'package:ns_meal/config/theme/colors.dart';

class Themes {
  static ThemeData lightThemeBuilder(BuildContext context) => ThemeData.light().copyWith(
    scaffoldBackgroundColor: Palette.white,
    primaryColor: Palette.primary,
    colorScheme: ThemeData().colorScheme.copyWith(
      primary: Palette.primary,
      background: Palette.white,
    )
  );
  static ThemeData darkThemeBuilder(BuildContext context) => ThemeData.dark().copyWith();
}