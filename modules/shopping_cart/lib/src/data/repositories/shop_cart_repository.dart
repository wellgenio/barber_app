import 'dart:async';

import '../../models/product_model.dart';

class ShoppingCartRepository {
  late final _cartStreamController =
      StreamController<List<ProductModel>>.broadcast();

  Stream<List<ProductModel>> get products => _cartStreamController.stream;

  final List<ProductModel> _products = [];

  void addProduct(ProductModel product) {
    _products.add(product);
    _cartStreamController.add(_products);
  }

  List<ProductModel> getProducts() {
    return List.unmodifiable(_products);
  }

  void removeProduct(ProductModel product) {
    _products.remove(product);
    _cartStreamController.add(_products);
  }
}
