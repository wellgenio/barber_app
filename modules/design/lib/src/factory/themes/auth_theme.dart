import 'package:flutter/material.dart';

import '../../app_theme.dart';

final authThemeLight = ThemeData.light().copyWith(
  extensions: [
    ThemeTypeExtension(themeType: ThemeType.auth),
    AppThemeExtension(
      colors: CustomColorPalette(
        primary: Colors.black,
        secondary: Colors.deepPurple,
        background: BackgroundPalette(
          solidBackground: Colors.grey[200]!,
          gradientBackground: LinearGradient(
            colors: [Colors.grey[300]!, Colors.grey[100]!],
          ),
        ),
        foreground: ForegroundColorPalette(
          active: Colors.black,
          normal: Colors.black,
          minimal: Colors.black,
          disabled: Colors.grey,
          detail: Colors.black,
          soft: Colors.black,
        ),
      ),
    ),
  ],
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.red[300],
      foregroundColor: Colors.black,
    ),
  ),
  appBarTheme: ThemeData.dark().appBarTheme,
);

final authThemeDark = ThemeData.dark().copyWith(
  extensions: [
    ThemeTypeExtension(themeType: ThemeType.auth),
    AppThemeExtension(
      colors: CustomColorPalette(
        primary: Colors.white,
        secondary: Colors.deepPurple,
        background: BackgroundPalette(
          solidBackground: Colors.grey[900]!,
          gradientBackground: LinearGradient(
            colors: [Colors.grey[800]!, Colors.grey[900]!],
          ),
        ),
        foreground: ForegroundColorPalette(
          active: Colors.white,
          normal: Colors.white,
          minimal: Colors.white,
          disabled: Colors.grey,
          detail: Colors.white,
          soft: Colors.white,
        ),
      ),
    ),
  ],
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.red[900],
      foregroundColor: Colors.white,
    ),
  ),
  appBarTheme: ThemeData.light().appBarTheme,
);
