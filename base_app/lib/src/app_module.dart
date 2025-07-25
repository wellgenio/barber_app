import 'dart:async';

import 'package:auth/auth.dart';
import 'package:barber_app/src/protected/ui/home_viewmodel.dart';
import 'package:shared/shared.dart';

import 'app_route.dart';

class AppModule extends Module {
  @override
  FutureOr<List<Module>> imports() => [AuthSharedModule()];

  @override
  FutureOr<List<Bind<Object>>> binds() => [
    Bind.factory((i) => HomeViewmodel(i.get<IAuthService>())),
  ];

  @override
  List<ModularRoute> get routes => AppRoute().routes;
}
