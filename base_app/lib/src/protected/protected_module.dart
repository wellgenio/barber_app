import 'dart:async';

import 'package:auth/auth.dart';
import 'package:shared/shared.dart';

import 'protected_route.dart';
import 'ui/home_viewmodel.dart';

class ProtectedModule extends Module {
  final GoPath? parent;
  final GoPath redirectTo;

  ProtectedModule({required this.redirectTo, this.parent});

  @override
  FutureOr<List<Bind<Object>>> binds() => [
    Bind.factory((i) => HomeViewmodel(i.get<IAuthFacade>())),
  ];

  @override
  List<ModularRoute> get routes =>
      ProtectedRoute(root: parent, redirectTo: redirectTo).routes;
}
