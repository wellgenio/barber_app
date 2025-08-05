import 'dart:async';

import 'package:flutter/material.dart';
import 'package:products/src/data/repositories/product_repository.dart';
import 'package:shared/shared.dart';

class ProductListWidget extends ModuleWidget {
  @override
  FutureOr<List<Bind<Object>>> binds() async {
    await Future.delayed(const Duration(seconds: 1));
    return [Bind.singleton<ProductRepository>((i) => ProductRepository())];
  }

  @override
  Widget get view => const ProductListWidgetView();

  @override
  Widget get pendingView => const Center(child: CircularProgressIndicator());
}

class ProductListWidgetView extends StatefulWidget {
  const ProductListWidgetView({super.key});

  @override
  State<ProductListWidgetView> createState() => _ProductListWidgetViewState();
}

class _ProductListWidgetViewState extends State<ProductListWidgetView> {
  @override
  Widget build(BuildContext context) {
    final repo = context.read<ProductRepository>();

    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          width: constraints.maxWidth,
          child: Card(
            elevation: 4,
            margin: const EdgeInsets.all(16),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Text('Product List Widget'),
                  Expanded(
                    child: ListView.builder(
                      itemCount: repo.products.length,
                      itemBuilder: (_, index) => ListTile(
                        leading: Text(repo.products[index].id.toString()),
                        title: Text(repo.products[index].name),
                        subtitle: Text(
                          '\$${repo.products[index].price.toStringAsFixed(2)}',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
