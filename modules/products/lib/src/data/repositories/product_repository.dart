import '../../models/product_model.dart';

class ProductRepository {
  final List<ProductModel> _products = [
    ProductModel(id: '1', name: 'Haircut', price: 20.0),
    ProductModel(id: '2', name: 'Shave', price: 15.0),
    ProductModel(id: '3', name: 'Beard Trim', price: 10.0),
  ];

  List<ProductModel> get products => _products;

  void addProduct(ProductModel product) {
    _products.add(product);
  }

  void removeProduct(ProductModel product) {
    _products.remove(product);
  }
}
