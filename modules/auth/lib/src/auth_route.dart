import 'package:shared/shared.dart';

import 'ui/login/login_page.dart';
import 'ui/register/register_page.dart';

class AuthRoute {
  /// Parent module path
  GoPath? root;

  AuthRoute._();

  static final _singleton = AuthRoute._();

  factory AuthRoute([GoPath? root]) {
    if (root != null) {
      _singleton.root = root;
    }

    return _singleton;
  }

  /// Paths
  GoPath get loginPage => GoPath(path: '/', name: 'login', root: root);

  GoPath get registerPage =>
      GoPath(path: '/register/:id', name: 'register', root: root);

  /// Routes
  List<ModularRoute> get routes => [
    ChildRoute(
      AuthRoute().loginPage.path,
      child: (context, state) {
        final name = state.uri.queryParameters['name'] ?? 'Guest';
        return LoginPage(name: name);
      },
      name: AuthRoute().loginPage.name,
    ),
    ChildRoute(
      AuthRoute().registerPage.path,
      child: (context, state) {
        final id = int.parse(state.pathParameters['id'] ?? '0');
        return RegisterPage(id: id);
      },
      name: AuthRoute().registerPage.name,
    ),
  ];
}
