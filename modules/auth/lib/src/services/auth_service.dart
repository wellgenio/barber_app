import 'package:shared/shared.dart';

import '../data/repositories/auth_repository.dart';

/// [IAuthService] é uma interface de comunicação externa ao modulo de autenticação.
/// Ela permite que outros módulos verifiquem o estado de autenticação e realizem ações relacionadas.
/// Qualquer módulo que precise verificar se o usuário está autenticado ou realizar logout deve usar esta classe.
///
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
