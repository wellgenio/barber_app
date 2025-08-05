class ProductModel {
  final String id;
  final String name;
  final double price;

  ProductModel({required this.id, required this.name, required this.price});

  toJson() {
    return {'id': id, 'name': name, 'price': price};
  }
}
