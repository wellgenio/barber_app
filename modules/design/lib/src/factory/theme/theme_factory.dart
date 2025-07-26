import 'package:flutter/material.dart';
import 'package:design/design.dart';

import 'dark_colors.dart';
import 'light_colors.dart';

abstract class ThemeFactory {
  static ThemeData buildDefaultTheme({
    Brightness brightness = Brightness.light,
  }) {
    final type = ThemeType.standard;

    AppTheme.instance.set(
      type,
      themeLight: ThemeData.light(),
      themeDark: ThemeData.dark(),
      colorPaletteLight: LightColorPalette(),
      colorPaletteDark: DarkColorPalette(),
    );
    AppTheme.instance.setCurrentType(type);
    return AppTheme.instance.get(type, brightness: brightness);
  }

  static ThemeData buildAuthModuleTheme() {
    final type = ThemeType.auth;
    AppTheme.instance.set(
      type,
      themeLight: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
          ),
        ),
        appBarTheme: ThemeData.dark().appBarTheme,
      ),
      themeDark: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red[900],
            foregroundColor: Colors.white,
          ),
        ),
        appBarTheme: ThemeData.light().appBarTheme,
      ),
      colorPaletteLight: LightColorPalette(),
      colorPaletteDark: DarkColorPalette(),
    );
    AppTheme.instance.setCurrentType(type);
    return AppTheme.instance.get(type);
  }

  static setCurrentTheme(ThemeType type) {
    return AppTheme.instance.setCurrentType(type);
  }

  static ThemeData buildFor(ThemeType type) => switch (type) {
    ThemeType.standard => buildDefaultTheme(),
    ThemeType.auth => buildAuthModuleTheme(),
  };
}

extension BuildContextThemeExtension on BuildContext {
  IColorPalette get colors => AppTheme.instance.colorPalette(
    AppTheme.instance.currentThemeType,
    brightness: Theme.of(this).brightness,
  );

  IColorPalette get invertedColors => AppTheme.instance.colorPalette(
    AppTheme.instance.currentThemeType,
    brightness: Theme.of(this).brightness == Brightness.light
        ? Brightness.dark
        : Brightness.light,
  );
}
