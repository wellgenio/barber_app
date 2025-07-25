import 'package:flutter/material.dart';
import 'package:go_router_modular/go_router_modular.dart';

import '../../auth_route.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key, required this.id});

  final int id;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Register with id: ${widget.id}'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.goNamed(AuthRoute().loginPage.name);
              },
              child: const Text('Back to Login'),
            ),
          ],
        ),
      ),
    );
  }
}
