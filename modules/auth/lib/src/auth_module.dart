import 'dart:async';

import 'package:shared/shared.dart';

import 'auth_route.dart';
import 'auth_shared_module.dart';
import 'ui/events/show_login_page_event.dart';

class AuthModule extends EventModule {
  final GoPath? parent;

  AuthModule([this.parent]) {
    listen();
  }

  @override
  void listen() {
    on<ShowLoginPageEvent>((event, context) {
      context.push(
        AuthRoute()
            .loginPage // path: /login?name=Jhoe+Doe
            .withQueryParamsMap({'name': 'Jhoe Doe'})
            .completePath,
      );
    }, autoDispose: false);
  }

  @override
  FutureOr<List<Module>> imports() => [AuthSharedModule()];

  @override
  List<ModularRoute> get routes => AuthRoute(parent).routes;
}
