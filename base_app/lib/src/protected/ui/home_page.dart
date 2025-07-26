import 'package:auth/auth.dart';
import 'package:barber_app/src/protected/ui/home_viewmodel.dart';
import 'package:faq/faq.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.viewmodel});

  final HomeViewmodel viewmodel;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeViewmodel get viewmodel => widget.viewmodel;

  @override
  void initState() {
    super.initState();
    viewmodel.logout.addListener(listener);
  }

  @override
  void didUpdateWidget(covariant HomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.viewmodel != viewmodel) {
      oldWidget.viewmodel.logout.removeListener(listener);
      viewmodel.logout.addListener(listener);
    }
  }

  void listener() {
    return switch (viewmodel.logout.value) {
      SuccessCommand() when mounted => context.go('/'),
      _ => null,
    };
  }

  @override
  void dispose() {
    viewmodel.logout.removeListener(listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline),
            onPressed: () {
              ModularEvent.fire(ShowFaqEvent(faqKey: FaqKey.faqCenter));
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Welcome to the Home Page!'),
            ElevatedButton(
              onPressed: () => viewmodel.logout.execute(),
              child: const Text('Logout'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ModularEvent.fire(
                  CheckAccessEvent(
                    userId: '42',
                    resource: 'schedule',
                    onCheckAccess: (hasAccess) async {
                      if (hasAccess && mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: Colors.green,
                            content: Text(
                              'Access granted',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        );
                      }
                    },
                  ),
                );
              },
              child: const Text('Check Access'),
            ),
          ],
        ),
      ),
    );
  }
}
