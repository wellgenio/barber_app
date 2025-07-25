import '../data/repositories/auth_repository.dart';

/// [IAuthService] é uma interface de comunicação externa ao modulo de autenticação.
/// Ela permite que outros módulos verifiquem o estado de autenticação e realizem ações relacionadas.
/// Qualquer módulo que precise verificar se o usuário está autenticado ou realizar logout deve usar esta classe.
///
abstract class IAuthService {
  void logout();
  bool get isAuthenticated;
}

class AuthService implements IAuthService {
  final AuthRepository _authRepository;

  AuthService(this._authRepository);

  void logout() => _authRepository.logout();

  bool get isAuthenticated => _authRepository.isAuthenticated;
}
