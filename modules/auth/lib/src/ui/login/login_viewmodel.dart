import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

import '../../data/repositories/auth_repository.dart';
import '../../models/request/login_model.dart';
import '../../models/response/user_model.dart';

class LoginViewmodel extends ChangeNotifier {
  final AuthRepository _authRepository;

  LoginViewmodel(this._authRepository);

  late final login = Command1<UserModel, LoginModel>(_authRepository.login);

  @override
  void dispose() {
    login.dispose();
    super.dispose();
  }
}
