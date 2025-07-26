import 'package:flutter/material.dart';
import 'package:design/design.dart';

class DarkBackgroundPalette implements IBackgroundPalette {
  const DarkBackgroundPalette();

  @override
  Gradient get gradientBackground => LinearGradient(
    colors: [const Color(0xFFD4D2BD), const Color(0xff140700)],
    stops: [0.0, 1.0],
  );

  @override
  Color get solidBackground => const Color(0xFFD4D2BD);
}

class DarkForegroundColorPalette implements IForegroundColorPalette {
  const DarkForegroundColorPalette();

  @override
  Color get active => const Color(0xffFAFBFF);

  @override
  Color get normal => const Color(0xffFAFBFF).withValues(alpha: 0.9);

  @override
  Color get minimal => const Color(0xffFAFBFF).withValues(alpha: 0.7);

  @override
  Color get disabled => const Color(0xffFAFBFF).withValues(alpha: 0.5);

  @override
  Color get detail => const Color(0xffFAFBFF).withValues(alpha: 0.25);

  @override
  Color get soft => const Color(0xffFAFBFF).withValues(alpha: 0.15);
}

class DarkColorPalette implements IColorPalette {
  final IBackgroundPalette backgroundPalette;
  final IForegroundColorPalette foreground;
  final MaterialColor primary;
  final MaterialColor secondary;
  final MaterialColor tertiary;

  const DarkColorPalette({
    this.backgroundPalette = const DarkBackgroundPalette(),
    this.foreground = const DarkForegroundColorPalette(),
    this.primary = const MaterialColor(0xff2A8DF1, {
      50: Color(0xffEBF8FF),
      100: Color(0xffCDEEFF),
      200: Color(0xffA6E0FF),
      300: Color(0xff78CDFF),
      400: Color(0xff53BAFF),
      500: Color(0xff38A8FF),
      600: Color(0xff2A8DF1),
      700: Color(0xff1E6ACD),
      800: Color(0xff154495),
      900: Color(0xff0B2054),
    }),
    this.secondary = const MaterialColor(0xff3F4CEB, {
      50: Color(0xffF3F4FF),
      100: Color(0xffE5E7FF),
      200: Color(0xffD1D5FF),
      300: Color(0xffB6C1FF),
      400: Color(0xff9FAEFF),
      500: Color(0xff8A9BFF),
      600: Color(0xff7A8AFF),
      700: Color(0xff6A79FF),
      800: Color(0xff5A68FF),
      900: Color(0xff4A57FF),
    }),
    this.tertiary = const MaterialColor(0xffB1E5FF, {
      50: Color(0xffF0FFFF),
      100: Color(0xffDFF7FF),
      200: Color(0xffC8EEFF),
      300: Color(0xffB1E5FF),
      400: Color(0xff9AD9FF),
      500: Color(0xff83CDFF),
      600: Color(0xff67EDFC),
      700: Color(0xff4ACDF9),
      800: Color(0xff2EADF6),
      900: Color(0xff128DF3),
    }),
  });
}
