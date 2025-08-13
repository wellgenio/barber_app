import 'dart:async';

import 'package:barber_app/i18n/translations.g.dart';
import 'package:flutter/material.dart';

import 'package:shared/shared.dart';

import 'src/app_widget.dart';
import 'src/app_module.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Modular.configure(
    appModule: AppModule(),
    initialRoute: '/',
    autoDisposeEventsBus: false,
    debugLogDiagnostics: true,
    debugLogDiagnosticsGoRouter: true,
    debugLogEventBus: true,
  );

  runApp(TranslationProvider(child: const AppWidget()));
}
