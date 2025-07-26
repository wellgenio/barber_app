import 'package:flutter/material.dart';

enum ThemeType { standard, auth }

abstract class IForegroundColorPalette {
  Color get active;
  Color get normal;
  Color get minimal;
  Color get disabled;
  Color get detail;
  Color get soft;
}

abstract class IBackgroundPalette {
  Color get solidBackground;
  Gradient get gradientBackground;
}

abstract class IColorPalette {
  IBackgroundPalette get backgroundPalette;
  IForegroundColorPalette get foreground;

  MaterialColor get primary;
  MaterialColor get secondary;
  MaterialColor get tertiary;
}

class AppTheme {
  AppTheme._();

  static final _instance = AppTheme._();

  final Map<ThemeType, (ThemeData, ThemeData)> _themes = {};
  final Map<ThemeType, (IColorPalette, IColorPalette)> _palettes = {};

  ThemeType currentThemeType = ThemeType.standard;

  static AppTheme get instance => _instance;

  void set(
    ThemeType type, {
    required ThemeData themeLight,
    required ThemeData themeDark,
    required IColorPalette colorPaletteLight,
    required IColorPalette colorPaletteDark,
  }) {
    _themes[type] = (themeLight, themeDark);
    _palettes[type] = (colorPaletteLight, colorPaletteDark);
  }

  void setCurrentType(ThemeType type) {
    currentThemeType = type;
  }

  void update(
    ThemeType type, {
    required IColorPalette colorPaletteLight,
    required IColorPalette colorPaletteDark,
    required ThemeData themeLight,
    required ThemeData themeDark,
  }) {
    _themes.remove(type);
    _themes.putIfAbsent(type, () => (themeLight, themeDark));

    _palettes.remove(type);
    _palettes.putIfAbsent(type, () => (colorPaletteLight, colorPaletteDark));
  }

  ThemeData get(ThemeType type, {Brightness brightness = Brightness.light}) {
    assert(_themes[type] != null, 'Theme should be initialized first.');

    return brightness == Brightness.light
        ? _themes[type]!.$1
        : _themes[type]!.$2;
  }

  IColorPalette colorPalette(
    ThemeType type, {
    Brightness brightness = Brightness.light,
  }) {
    assert(_palettes[type] != null, 'Theme should be initialized first.');
    return brightness == Brightness.light
        ? _palettes[type]!.$1
        : _palettes[type]!.$2;
  }
}
