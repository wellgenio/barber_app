import 'dart:async';

import 'package:shared/shared.dart';
// ignore: depend_on_referenced_packages
import 'package:shopping_cart/shopping_cart.dart';

import 'protected_route.dart';

class ProtectedModule extends Module {
  final GoPath? parent;
  final GoPath redirectTo;

  ProtectedModule({required this.redirectTo, this.parent});

  @override
  FutureOr<List<Module>> imports() => [ShoppingCartModule()];

  @override
  List<ModularRoute> get routes =>
      ProtectedRoute(root: parent, redirectTo: redirectTo).routes;
}
