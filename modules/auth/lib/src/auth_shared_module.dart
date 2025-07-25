import 'dart:async';

import 'package:go_router_modular/go_router_modular.dart';

import 'data/repositories/auth_repository.dart';
import 'services/auth_service.dart';

class AuthSharedModule extends Module {
  @override
  FutureOr<List<Bind<Object>>> binds() => [
    Bind.singleton((i) => AuthRepository()),
    Bind.singleton((i) => AuthService(i.get<AuthRepository>())),
  ];
}
