import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

import '../../../data/repositories/shop_cart_repository.dart';
import '../../../models/product_model.dart';

class ShoppingCartListWidget extends StatefulWidget {
  const ShoppingCartListWidget({super.key});

  @override
  State<ShoppingCartListWidget> createState() => _ShoppingCartListWidgetState();
}

class _ShoppingCartListWidgetState extends State<ShoppingCartListWidget> {
  late final repo = context.read<ShoppingCartRepository>();
  List<ProductModel> products = [];

  @override
  void initState() {
    super.initState();
    products = repo.getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder(
        stream: repo.products,
        builder: (context, asyncSnapshot) {
          if (asyncSnapshot.hasData) {
            products = asyncSnapshot.data!;
          }
          return Card(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return ListTile(
                  title: Text(product.name),
                  subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.remove_shopping_cart),
                    onPressed: () => repo.removeProduct(product),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
