import 'package:auth/auth.dart';
import 'package:design/design.dart';
import 'package:faq/faq.dart';
import 'package:flutter/material.dart';
import 'package:products/products.dart';
import 'package:shared/shared.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
          spacing: 42,
          children: [
            //LogoutButtonWidget(),
            const SizedBox(height: 20),

            Flexible(
              flex: 2,
              child: Text(
                'Welcome to the Home Page!',
                style: TextStyle(
                  color: context.invertedColors.primary,
                  fontSize: 24,
                ),
              ),
            ),

            Flexible(flex: 2, child: LogoutButtonWidget()),

            Flexible(
              flex: 2,
              child: ElevatedButton(
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
            ),

            Flexible(flex: 8, child: ProductListWidget()),
          ],
        ),
      ),
    );
  }
}
