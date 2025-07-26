import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../app_theme.dart';
import '../factory/theme/theme_factory.dart';

class LocalTheme extends StatelessWidget {
  final WidgetBuilder builder;

  final ThemeData theme;

  final SystemUiOverlayStyle? systemUiOverlayStyle;

  const LocalTheme._({
    required this.builder,
    required this.theme,
    this.systemUiOverlayStyle,
  });

  factory LocalTheme.dark({
    required WidgetBuilder builder,
    bool invertSystemUiOverlayStyle = false,
  }) {
    return LocalTheme._(
      builder: builder,
      systemUiOverlayStyle: invertSystemUiOverlayStyle
          ? SystemUiOverlayStyle.light
          : null,
      theme: AppTheme.instance.get(
        ThemeType.standard,
        brightness: Brightness.dark,
      ),
    );
  }

  factory LocalTheme.light({
    required WidgetBuilder builder,
    bool invertSystemUiOverlayStyle = false,
  }) {
    return LocalTheme._(
      builder: builder,
      systemUiOverlayStyle: invertSystemUiOverlayStyle
          ? SystemUiOverlayStyle.dark
          : null,
      theme: AppTheme.instance.get(
        ThemeType.standard,
        brightness: Brightness.light,
      ),
    );
  }

  factory LocalTheme.system({
    required BuildContext context,
    required WidgetBuilder builder,
    bool invertSystemUiOverlayStyle = true,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return LocalTheme._(
      builder: builder,
      theme: AppTheme.instance.get(
        ThemeType.standard,
        brightness: isDark ? Brightness.dark : Brightness.light,
      ),
      systemUiOverlayStyle: invertSystemUiOverlayStyle
          ? isDark
                ? SystemUiOverlayStyle.light
                : SystemUiOverlayStyle.dark
          : null,
    );
  }

  factory LocalTheme.custom({
    required WidgetBuilder builder,
    required ThemeData theme,
    SystemUiOverlayStyle? systemUiOverlayStyle,
  }) {
    return LocalTheme._(
      builder: builder,
      systemUiOverlayStyle: systemUiOverlayStyle,
      theme: theme,
    );
  }

  factory LocalTheme.inverted({
    required BuildContext context,
    required WidgetBuilder builder,
    bool invertSystemUiOverlayStyle = true,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return LocalTheme._(
      builder: builder,
      theme: AppTheme.instance.get(
        AppTheme.instance.currentThemeType,
        brightness: isDark ? Brightness.dark : Brightness.light,
      ),
      systemUiOverlayStyle: invertSystemUiOverlayStyle
          ? isDark
                ? SystemUiOverlayStyle.dark
                : SystemUiOverlayStyle.light
          : null,
    );
  }

  factory LocalTheme.byType({
    required BuildContext context,
    required WidgetBuilder builder,
    required ThemeType type,
    bool invertSystemUiOverlayStyle = false,
  }) {
    final theme = ThemeFactory.buildFor(type);

    final shouldInvert = Theme.of(context).brightness != theme.brightness;
    SystemUiOverlayStyle? style;
    if (shouldInvert) {
      style = theme.brightness == Brightness.dark
          ? SystemUiOverlayStyle.light
          : SystemUiOverlayStyle.dark;
    }

    return LocalTheme._(
      builder: builder,
      systemUiOverlayStyle: style,
      theme: theme,
    );
  }

  @override
  Widget build(BuildContext context) {
    final styledWidget = Theme(
      data: theme,
      child: Builder(builder: builder),
    );

    if (systemUiOverlayStyle != null) {
      return AnnotatedRegion<SystemUiOverlayStyle>(
        value: systemUiOverlayStyle!,
        child: styledWidget,
      );
    }

    return styledWidget;
  }
}
