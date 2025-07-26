import 'package:shared/shared.dart';

import '../data/repositories/auth_repository.dart';

/// A camada `services/` é responsável pela comunicação externa ao módulo de autenticação.
/// Ela permite que outros módulos verifiquem o estado de autenticação e realizem ações relacionadas.
/// Qualquer módulo que precise verificar se o usuário está autenticado ou realizar logout deve usar esta classe.
///
/// [IAuthService] define a interface para essas operações.
abstract class IAuthService {
  AsyncResult<Unit> logout();
  Future<bool> isLoggedIn();
}

class AuthService implements IAuthService {
  final AuthRepository _authRepository;

  AuthService(this._authRepository);

  AsyncResult<Unit> logout() => _authRepository.logout();

  Future<bool> isLoggedIn() => _authRepository.isLoggedIn();
}
