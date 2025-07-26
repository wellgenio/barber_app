import 'dart:async';
import 'package:auth/src/data/api/interceptors/auth_interceptor.dart';
import 'package:design/design.dart';
import 'package:shared/shared.dart';

import 'data/api/auth_api.dart';
import 'data/local/auth_local.dart';
import 'data/repositories/auth_repository.dart';
import 'facades/auth_facade.dart';

class AuthSharedModule extends Module {
  AuthSharedModule() {
    ThemeFactory.buildAuthModuleTheme();
  }

  @override
  FutureOr<List<Bind<Object>>> binds() async {
    final localStorage = await localStorageFactory();
    final authLocal = AuthLocal(localStorage);

    const baseUrl = String.fromEnvironment('BASE_URL');
    final dio = await dioFactory(
      baseUrl: baseUrl,
      interceptors: [AuthInterceptor(authLocal)],
    );

    return [
      Bind.singleton<ILocalStorage>((i) => localStorage),
      Bind.singleton<AuthLocal>((i) => authLocal),
      Bind.factory<Dio>((i) => dio),
      Bind.factory((i) => AuthApi(i.get<Dio>())),
      Bind.singleton(
        (i) => AuthRepository(i.get<AuthApi>(), i.get<AuthLocal>()),
      ),
      Bind.factory<IAuthFacade>((i) => AuthFacade(i.get<AuthRepository>())),
    ];
  }
}
