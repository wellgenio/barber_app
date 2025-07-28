import 'package:flutter/material.dart';

import '../../app_theme.dart';

final standardThemeLight = ThemeData.light().copyWith(
  extensions: [
    ThemeTypeExtension(themeType: ThemeType.standard),
    AppThemeExtension(
      colors: CustomColorPalette(
        primary: Colors.blue[900]!,
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
);

final standardThemeDark = ThemeData.dark().copyWith(
  extensions: [
    ThemeTypeExtension(themeType: ThemeType.standard),
    AppThemeExtension(
      colors: CustomColorPalette(
        primary: Colors.blue[200]!,
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
);
