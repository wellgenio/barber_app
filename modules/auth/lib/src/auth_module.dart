import 'dart:async';

import 'package:shared/shared.dart';

import 'auth_route.dart';
import 'auth_shared_module.dart';
import 'data/repositories/auth_repository.dart';
import 'ui/bottom_sheets/forbidden_bottom_sheet.dart';
import 'ui/events/check_access_event.dart';
import 'ui/events/show_login_page_event.dart';
import 'ui/login/login_viewmodel.dart';
import 'ui/register/register_viewmodel.dart';

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

    on<CheckAccessEvent>((event, context) async {
      final authRepository = context.read<AuthRepository>();
      final hasAccess = await authRepository.checkAccess(userId: event.userId);

      if (hasAccess == false) {
        ForbiddenBottomSheet().show(context);
      }
      event.onCheckAccess(hasAccess);
    }, autoDispose: false);
  }

  @override
  FutureOr<List<Module>> imports() => [AuthSharedModule()];

  @override
  FutureOr<List<Bind<Object>>> binds() => [
    Bind.factory((i) => LoginViewmodel(i.get<AuthRepository>())),
    Bind.factory((i) => RegisterViewmodel()),
  ];

  @override
  List<ModularRoute> get routes => AuthRoute(parent).routes;
}
