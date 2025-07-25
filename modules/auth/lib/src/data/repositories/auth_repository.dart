/// [AuthRepository] é responsável por gerenciar o estado de autenticação do usuário.
/// Ele fornece métodos para login, logout e verificação do estado de autenticação.
/// Este repositório é utilizado internamente ao módulo de autenticação.
/// Outros módulos devem interagir com o [AuthService] para realizar ações relacionadas à autenticação.

class AuthRepository {
  bool _isAuthenticated = false;
  bool get isAuthenticated => _isAuthenticated;

  void login() {
    _isAuthenticated = true;
  }

  void logout() {
    _isAuthenticated = false;
  }
}
