import 'package:flutter/painting.dart';

class AddProductToCartEvent {
  final Map<String, dynamic> jsonProduct;
  final VoidCallback onSuccess;

  AddProductToCartEvent(this.jsonProduct, {required this.onSuccess});
}
