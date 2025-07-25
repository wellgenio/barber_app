import 'package:shared/shared.dart';

import 'protected_route.dart';

class ProtectedModule extends Module {
  final GoPath? parent;
  final GoPath redirectTo;

  ProtectedModule({required this.redirectTo, this.parent});
  @override
  List<ModularRoute> get routes =>
      ProtectedRoute(root: parent, redirectTo: redirectTo).routes;
}
