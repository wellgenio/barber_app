import 'dart:math';

import 'package:auth/src/models/response/session_model.dart';
import 'package:shared/shared.dart';

import '../../models/request/login_model.dart';
import '../../models/response/user_model.dart';
import '../api/auth_api.dart';
import '../local/auth_local.dart';

/// [AuthRepository] é responsável por gerenciar o estado de autenticação do usuário.
/// Ele fornece métodos para login, logout e verificação do estado de autenticação.
/// Este repositório é utilizado internamente ao módulo de autenticação.
/// Outros módulos devem interagir com o [AuthService] para realizar ações relacionadas à autenticação.

class AuthRepository {
  final AuthApi _authApi;
  final AuthLocal _authLocal;

  AuthRepository(this._authApi, this._authLocal);

  AsyncResult<UserModel> login(LoginModel loginDto) async {
    // Validate the login model
    // final messageError = loginDto.validate();
    // if (messageError != null) {
    //   return Failure(Exception(messageError));
    // }

    final user = UserModel(
      id: '1',
      email: 'user@example.com',
      name: 'User Name',
    );
    // Mocked code:
    _authLocal.saveSession(
      SessionModel(user: user, accessToken: '', refreshToken: ''),
    );

    return Success(user);
    // Real code:
    // return _authApi //
    //     .login(loginDto)
    //     .toResult()
    //     .flatMap(_authLocal.saveSession)
    //     .map((session) => session.user);
  }

  AsyncResult<Unit> logout() {
    return _authLocal.clear();
  }

  Future<bool> isLoggedIn() async {
    final result = await _authLocal.getSession();
    return result.isSuccess();
  }

  Future<bool> checkAccess({required String userId}) async {
    // Simulate access check with a random boolean
    return Random().nextInt(10) > 5;
  }
}
