import 'package:design/src/factory/themes/auth_theme.dart';
import 'package:flutter/material.dart';
import 'package:design/design.dart';

import 'themes/standard_theme.dart';

abstract class ThemeFactory {
  static ThemeData buildDefaultTheme({
    Brightness brightness = Brightness.light,
  }) {
    final type = ThemeType.standard;
    AppTheme.instance.set(
      type,
      themeLight: standardThemeLight,
      themeDark: standardThemeDark,
    );
    AppTheme.instance.setCurrentType(type);
    return AppTheme.instance.get(type, brightness: brightness);
  }

  static ThemeData buildAuthModuleTheme() {
    final type = ThemeType.auth;
    AppTheme.instance.set(
      type,
      themeLight: authThemeLight,
      themeDark: authThemeDark,
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
