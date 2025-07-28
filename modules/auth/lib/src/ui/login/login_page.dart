import 'package:auth/src/models/response/user_model.dart';
import 'package:design/design.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

import '../../auth_route.dart';
import '../../models/request/login_model.dart';
import 'login_viewmodel.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.name, required this.viewModel});

  final String name;
  final LoginViewmodel viewModel;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginViewmodel get viewModel => widget.viewModel;

  @override
  void initState() {
    super.initState();
    viewModel.login.addListener(listener);
  }

  @override
  void didUpdateWidget(covariant LoginPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.viewModel != viewModel) {
      oldWidget.viewModel.login.removeListener(listener);
      viewModel.login.addListener(listener);
    }
  }

  void listener() {
    return switch (viewModel.login.value) {
      FailureCommand<UserModel>(:final error) =>
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(error.toString().replaceAll('Exception: ', '')),
          ),
        ),
      SuccessCommand<UserModel>() when mounted => context.go('/'),
      _ => null,
    };
  }

  @override
  void dispose() {
    viewModel.login.removeListener(listener);
    viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Login to continue', style: context.text.body),
            ValueListenableBuilder(
              valueListenable: viewModel.login,
              builder: (context, loginState, child) {
                final isLoading = loginState.isRunning;

                return ElevatedButton(
                  onPressed: () {
                    if (isLoading) return;
                    viewModel.login.execute(
                      LoginModel(email: '', password: ''),
                    );
                  },
                  child: isLoading
                      ? SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(),
                        )
                      : Text('Login - ${widget.name}'),
                );
              },
            ),
            ElevatedButton(
              onPressed: () {
                context.push(
                  AuthRoute()
                      .registerPage // path: /register/:id
                      .withPathParamsMap({'id': 42})
                      .completePath,
                );
              },
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
