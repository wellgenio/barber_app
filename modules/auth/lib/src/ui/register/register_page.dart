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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Register with id: ${widget.id}'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.pop(),
              child: const Text('Back to Login'),
            ),
          ],
        ),
      ),
    );
  }
}
