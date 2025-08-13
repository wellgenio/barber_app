import 'dart:async';
import 'package:flutter/widgets.dart';

class GlobalLangManager {
  static final GlobalLangManager _instance = GlobalLangManager._();
  Locale _locale = Locale('en', 'US');

  final StreamController<Locale> _localeController =
      StreamController<Locale>.broadcast();

  GlobalLangManager._();

  factory GlobalLangManager() => _instance;

  static GlobalLangManager get instance => _instance;

  Locale get locale => _locale;
  String get rawLocale => _locale.toLanguageTag();

  void setlocale(Locale value) {
    _locale = value;
    _localeController.add(value);
  }

  Stream<Locale> get localeStream => _localeController.stream;

  Stream<String> get rawLocaleStream =>
      _localeController.stream.map((locale) => locale.toLanguageTag());

  void dispose() {
    _localeController.close();
  }
}
