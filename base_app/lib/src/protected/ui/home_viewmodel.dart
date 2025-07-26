import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:auth/auth.dart';

class HomeViewmodel extends ChangeNotifier {
  final IAuthFacade _authFacade;

  HomeViewmodel(this._authFacade);

  late final logout = Command0<Unit>(_authFacade.logout);
}
