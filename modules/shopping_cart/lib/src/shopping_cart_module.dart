import 'dart:async';

import 'package:shared/shared.dart';
import 'package:shopping_cart/src/models/product_model.dart';

import 'data/repositories/shop_cart_repository.dart';
import 'ui/events/add_product_to_cart_event.dart';

class ShoppingCartModule extends EventModule {
  ShoppingCartModule() {
    listen();
  }

  @override
  FutureOr<List<Bind<Object>>> binds() {
    return [
      Bind.singleton<ShoppingCartRepository>((i) => ShoppingCartRepository()),
    ];
  }

  @override
  void listen() {
    on<AddProductToCartEvent>((event, context) async {
      if (context != null) {
        final repo = context.read<ShoppingCartRepository>();
        repo.addProduct(ProductModel.fromJson(event.jsonProduct));
        event.onSuccess();
      }
    });
  }
}
