import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:auth/auth.dart';

class HomeViewmodel extends ChangeNotifier {
  final IAuthService _authService;

  HomeViewmodel(this._authService);

  late final logout = Command0<Unit>(_authService.logout);
}
