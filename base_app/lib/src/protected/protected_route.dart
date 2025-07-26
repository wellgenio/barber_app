import 'package:auth/auth.dart';
import 'package:faq/faq.dart';
import 'package:shared/shared.dart';

import 'ui/home_page.dart';
import 'ui/home_viewmodel.dart';

class ProtectedRoute {
  /// Parent module path
  GoPath? root;
  GoPath? _redirectTo;

  ProtectedRoute._();

  static final _singleton = ProtectedRoute._();

  factory ProtectedRoute({GoPath? root, GoPath? redirectTo}) {
    if (root != null) {
      _singleton.root = root;
    }

    if (redirectTo != null) {
      _singleton._redirectTo = redirectTo;
    }

    return _singleton;
  }

  GoPath get home => GoPath(path: '/', name: 'home', root: root);
  GoPath get faq => GoPath(path: '/faq', name: 'faq', root: root);

  List<ModularRoute> get routes => [
    ChildRoute(
      home.path,
      child: (context, _) {
        final viewmodel = HomeViewmodel(context.read<IAuthFacade>());
        return HomePage(viewmodel: viewmodel);
      },
      redirect: authGuard(_redirectTo!),
      name: home.name,
    ),
    ModuleRoute(faq.path, module: FaqModule(faq)),
  ];
}
