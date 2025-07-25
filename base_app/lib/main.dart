import 'dart:async';

import 'package:flutter/material.dart';

import 'package:shared/shared.dart';

import 'src/app_widget.dart';
import 'src/app_module.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runZoned(() async {
    await Modular.configure(
      appModule: AppModule(),
      initialRoute: '/',
      debugLogDiagnostics: true,
      debugLogDiagnosticsGoRouter: true,
      debugLogEventBus: true,
    );
  });

  runApp(const AppWidget());
}
