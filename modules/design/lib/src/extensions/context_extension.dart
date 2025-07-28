import 'package:flutter/material.dart';

import '../app_theme.dart';
import '../factory/size_config/size_config.dart';

extension BuildContextThemeExtension on BuildContext {
  CustomColorPalette get colors =>
      Theme.of(this).extension<AppThemeExtension>()!.colors;

  CustomColorPalette get invertedColors {
    final isLight = Theme.of(this).brightness == Brightness.light;
    final oppositeBrightness = isLight ? Brightness.dark : Brightness.light;

    final currentThemeType = Theme.of(
      this,
    ).extension<AppThemeTypeExtension>()!.themeType;

    final themeData = AppTheme.instance.get(
      currentThemeType,
      brightness: oppositeBrightness,
    );

    return themeData.extension<AppThemeExtension>()!.colors;
  }

  CustomTypography get text =>
      Theme.of(this).extension<AppTypographyExtension>()!.typography;
}

extension SizeConfigExtension on BuildContext {
  double get screenWidth => SizeConfig.screenWidth;
  double get screenHeight => SizeConfig.screenHeight;

  bool get isPortrait => SizeConfig.isPortrait;
  TypeScreen get typeScreen => SizeConfig.typeScreen;
}
