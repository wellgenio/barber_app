import 'package:shared/shared.dart';

import 'protected/protected_module.dart';
import 'public/public_module.dart';

class AppRoute {
  AppRoute._();

  static final _singleton = AppRoute._();
  //static final _talker = Talker();

  factory AppRoute() {
    return _singleton;
  }

  GoPath get protected => GoPath(path: '/', name: 'protected');
  GoPath get public => GoPath(path: '/public', name: 'public');

  List<ModularRoute> get routes => [
    ShellModularRoute(
      //observers: [TalkerRouteObserver(_talker)],
      builder: (context, state, child) => child,
      routes: [
        ModuleRoute(
          protected.path,
          module: ProtectedModule(redirectTo: public, parent: protected),
        ),
        ModuleRoute(public.path, module: PublicModule(parent: public)),
      ],
    ),
  ];
}
