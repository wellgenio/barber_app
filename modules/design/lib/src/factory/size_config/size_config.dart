import 'package:flutter/material.dart';

enum TypeScreen {
  mobile,
  tablet,
  desktop,
  largeScreen,
  ultraWide;

  static TypeScreen fromWidth(double width) => switch (width) {
    < 600 => TypeScreen.mobile,
    < 1200 => TypeScreen.tablet,
    < 1800 => TypeScreen.desktop,
    < 2400 => TypeScreen.largeScreen,
    _ => TypeScreen.ultraWide,
  };
}

class SizeConfig {
  static double get screenWidth => _screenWidth;
  static double get screenHeight => _screenHeight;
  static bool get isPortrait => _isPortrait;
  static TypeScreen get typeScreen => _typeScreen;

  static late double _screenWidth;
  static late double _screenHeight;
  static late bool _isPortrait;
  static late TypeScreen _typeScreen;

  SizeConfig._();

  static final SizeConfig _instance = SizeConfig._();

  factory SizeConfig() => _instance;

  void config(BoxConstraints constraints, Orientation orientation) {
    _screenWidth = constraints.maxWidth;
    _screenHeight = constraints.maxHeight;
    _isPortrait = orientation == Orientation.portrait;
    _typeScreen = TypeScreen.fromWidth(_screenWidth);
  }
}

extension SizeConfigExtension on BuildContext {
  double get screenWidth => SizeConfig.screenWidth;
  double get screenHeight => SizeConfig.screenHeight;

  bool get isPortrait => SizeConfig.isPortrait;
  TypeScreen get typeScreen => SizeConfig.typeScreen;
}
