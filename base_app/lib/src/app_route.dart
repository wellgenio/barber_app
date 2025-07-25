import 'package:shared/shared.dart';

import 'protected/protected_module.dart';
import 'public/public_module.dart';

class AppRoute {
  AppRoute._();

  static final _singleton = AppRoute._();

  factory AppRoute() {
    return _singleton;
  }

  GoPath get protected => GoPath(path: '/', name: 'protected');
  GoPath get public => GoPath(path: '/public', name: 'public');

  List<ModularRoute> get routes => [
    ModuleRoute(
      protected.path,
      module: ProtectedModule(redirectTo: public, parent: protected),
    ),
    ModuleRoute(public.path, module: PublicModule(parent: public)),
  ];
}
