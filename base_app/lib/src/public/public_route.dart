import 'package:auth/auth.dart';
import 'package:shared/shared.dart';

import 'ui/splash_page.dart';

class PublicRoute {
  /// Parent module path
  GoPath? root;

  PublicRoute._();

  static final _singleton = PublicRoute._();

  factory PublicRoute({GoPath? root}) {
    if (root != null) {
      _singleton.root = root;
    }

    return _singleton;
  }

  GoPath get splash => GoPath(path: '/', name: 'splash', root: root);
  GoPath get authModule => GoPath(path: '/auth', name: 'auth', root: root);

  List<ModularRoute> get routes => [
    ChildRoute(
      splash.path,
      child: (context, _) => const SplashPage(),
      name: splash.name,
    ),
    ModuleRoute(authModule.path, module: AuthModule(authModule)),
  ];
}
