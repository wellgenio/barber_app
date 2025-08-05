class ProductModel {
  final String id;
  final String name;
  final double price;

  ProductModel({required this.id, required this.name, required this.price});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      price: json['price'],
    );
  }
}
