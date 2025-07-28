import 'package:flutter/material.dart';

enum ThemeType { standard, auth }

class ForegroundColorPalette {
  final Color active;
  final Color normal;
  final Color minimal;
  final Color disabled;
  final Color detail;
  final Color soft;

  ForegroundColorPalette({
    required this.active,
    required this.normal,
    required this.minimal,
    required this.disabled,
    required this.detail,
    required this.soft,
  });

  static ForegroundColorPalette lerp(
    ForegroundColorPalette a,
    ForegroundColorPalette b,
    double t,
  ) {
    return ForegroundColorPalette(
      active: Color.lerp(a.active, b.active, t)!,
      normal: Color.lerp(a.normal, b.normal, t)!,
      minimal: Color.lerp(a.minimal, b.minimal, t)!,
      disabled: Color.lerp(a.disabled, b.disabled, t)!,
      detail: Color.lerp(a.detail, b.detail, t)!,
      soft: Color.lerp(a.soft, b.soft, t)!,
    );
  }
}

class BackgroundPalette {
  final Color solidBackground;
  final Gradient gradientBackground;

  BackgroundPalette({
    required this.solidBackground,
    required this.gradientBackground,
  });

  static BackgroundPalette lerp(
    BackgroundPalette a,
    BackgroundPalette b,
    double t,
  ) {
    return BackgroundPalette(
      solidBackground: Color.lerp(a.solidBackground, b.solidBackground, t)!,
      gradientBackground: t < 0.5 ? a.gradientBackground : b.gradientBackground,
    );
  }
}

class CustomColorPalette {
  final Color primary;
  final Color secondary;
  final BackgroundPalette background;
  final ForegroundColorPalette foreground;

  const CustomColorPalette({
    required this.primary,
    required this.secondary,
    required this.background,
    required this.foreground,
  });

  static CustomColorPalette lerp(
    CustomColorPalette a,
    CustomColorPalette b,
    double t,
  ) {
    return CustomColorPalette(
      primary: Color.lerp(a.primary, b.primary, t)!,
      secondary: Color.lerp(a.secondary, b.secondary, t)!,
      background: BackgroundPalette.lerp(a.background, b.background, t),
      foreground: ForegroundColorPalette.lerp(a.foreground, b.foreground, t),
    );
  }
}

class AppTheme {
  AppTheme._();

  static final _instance = AppTheme._();

  final Map<ThemeType, (ThemeData, ThemeData)> _themes = {};

  ThemeType currentThemeType = ThemeType.standard;

  static AppTheme get instance => _instance;

  void set(
    ThemeType type, {
    required ThemeData themeLight,
    required ThemeData themeDark,
  }) {
    _themes[type] = (themeLight, themeDark);
  }

  void setCurrentType(ThemeType type) {
    currentThemeType = type;
  }

  void update(
    ThemeType type, {
    required ThemeData themeLight,
    required ThemeData themeDark,
  }) {
    _themes.remove(type);
    _themes.putIfAbsent(type, () => (themeLight, themeDark));
  }

  ThemeData get(ThemeType type, {Brightness brightness = Brightness.light}) {
    assert(_themes[type] != null, 'Theme should be initialized first.');

    return brightness == Brightness.light
        ? _themes[type]!.$1
        : _themes[type]!.$2;
  }
}

@immutable
class AppThemeExtension extends ThemeExtension<AppThemeExtension> {
  final CustomColorPalette colors;

  const AppThemeExtension({required this.colors});

  @override
  AppThemeExtension copyWith({CustomColorPalette? colors}) {
    return AppThemeExtension(colors: colors ?? this.colors);
  }

  @override
  AppThemeExtension lerp(ThemeExtension<AppThemeExtension>? other, double t) {
    if (other is! AppThemeExtension) return this;

    return AppThemeExtension(
      colors: CustomColorPalette.lerp(this.colors, other.colors, t),
    );
  }
}

@immutable
class ThemeTypeExtension extends ThemeExtension<ThemeTypeExtension> {
  final ThemeType themeType;

  const ThemeTypeExtension({required this.themeType});

  @override
  ThemeTypeExtension copyWith({ThemeType? themeType}) {
    return ThemeTypeExtension(themeType: themeType ?? this.themeType);
  }

  @override
  ThemeTypeExtension lerp(ThemeExtension<ThemeTypeExtension>? other, double t) {
    if (other is! ThemeTypeExtension) return this;
    return this;
  }
}
