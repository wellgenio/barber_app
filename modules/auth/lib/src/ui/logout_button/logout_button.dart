import 'dart:async';
import 'package:flutter/material.dart';

import 'package:auth/auth.dart';
import 'package:auth/src/data/repositories/auth_repository.dart';
import 'package:shared/shared.dart';

class LogoutButtonWidget extends ModuleWidget {
  @override
  FutureOr<List<Module>> imports() {
    return [AuthSharedModule()];
  }

  @override
  Widget get view => LogoutButtonView();
}

class LogoutButtonView extends StatefulWidget {
  const LogoutButtonView({super.key});

  @override
  State<LogoutButtonView> createState() => _LogoutButtonViewState();
}

class _LogoutButtonViewState extends State<LogoutButtonView> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        final repo = context.read<AuthRepository>();
        final result = repo.logout();

        result.fold(
          (success) => context.go('/'),
          (_) => ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Logout failed!'))),
        );
      },
      child: Text('Logout'),
    );
  }
}
