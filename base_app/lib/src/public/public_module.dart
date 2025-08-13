import 'package:shared/shared.dart';

import 'public_route.dart';

class PublicModule extends Module {
  final GoPath? parent;

  PublicModule({this.parent});

  @override
  List<ModularRoute> get routes => PublicRoute.init(parent).routes;
}
