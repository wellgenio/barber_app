import 'package:design/design.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

import 'ui/login/login_page.dart';
import 'ui/login/login_viewmodel.dart';
import 'ui/register/register_page.dart';

class AuthRoute {
  /// Parent module path
  GoPath? root;

  AuthRoute._();

  static final _singleton = AuthRoute._();

  factory AuthRoute.init([GoPath? root]) {
    if (root != null) {
      _singleton.root = root;
    }

    return _singleton;
  }

  /// Paths
  static GoPath get loginPage =>
      GoPath(path: '/login', name: 'login', root: _singleton.root);

  static GoPath get registerPage =>
      GoPath(path: '/register/:id', name: 'register', root: _singleton.root);

  /// Routes
  List<ModularRoute> get routes => [
    ShellModularRoute(
      builder: (context, state, child) {
        final brightness = Theme.of(context).brightness;
        final themeType = ThemeType.auth;
        final theme = AppTheme.instance.get(themeType, brightness: brightness);
        AppTheme.instance.setCurrentType(themeType);

        return LocalTheme.custom(theme: theme, builder: (context) => child);
      },
      routes: [
        ChildRoute(
          loginPage.path,
          child: (context, state) {
            final name = state.uri.queryParameters['name'] ?? 'Guest';
            final viewModel = context.read<LoginViewmodel>();

            return LoginPage(name: name, viewModel: viewModel);
          },
          name: loginPage.name,
        ),
        ChildRoute(
          registerPage.path,
          child: (context, state) {
            final id = int.parse(state.pathParameters['id'] ?? '0');
            return RegisterPage(id: id);
          },
          name: registerPage.name,
        ),
      ],
    ),
  ];
}
