import 'package:flutter/material.dart';
import 'package:go_router_modular/go_router_modular.dart';

import '../../auth_route.dart';
import '../../data/repositories/auth_repository.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.name});

  final String name;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
            const Text('Login to continue'),
            ElevatedButton(
              onPressed: () {
                context.read<AuthRepository>().login();
                context.go('/');
              },
              child: Text('Login - ${widget.name}'),
            ),
            ElevatedButton(
              onPressed: () {
                context.go(
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
