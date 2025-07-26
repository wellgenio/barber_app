import 'dart:async';

import 'package:auth/auth.dart';
import 'package:shared/shared.dart';

import 'app_route.dart';

class AppModule extends Module {
  @override
  FutureOr<List<Module>> imports() => [AuthSharedModule()];

  @override
  List<ModularRoute> get routes => AppRoute().routes;
}
