import 'package:design/design.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

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
      backgroundColor: context.colors.background.solidBackground,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Register with id: ${widget.id}',
              style: TextStyle(color: context.colors.primary),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.pop(),
              child: Text(
                'Back to Login',
                style: TextStyle(color: context.invertedColors.primary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
