import 'package:shared/shared.dart';

import '../data/repositories/auth_repository.dart';

/// A camada `facades/` é responsável pela comunicação externa ao módulo de autenticação.
/// Ela permite que outros módulos verifiquem o estado de autenticação e realizem ações relacionadas.
/// Qualquer módulo que precise verificar se o usuário está autenticado ou realizar logout deve usar esta classe.
///
/// [IAuthFacade] define a interface para essas operações.
abstract class IAuthFacade {
  AsyncResult<Unit> logout();
  Future<bool> isLoggedIn();
}

class AuthFacade implements IAuthFacade {
  final AuthRepository _authRepository;

  AuthFacade(this._authRepository);

  AsyncResult<Unit> logout() => _authRepository.logout();

  Future<bool> isLoggedIn() => _authRepository.isLoggedIn();
}
