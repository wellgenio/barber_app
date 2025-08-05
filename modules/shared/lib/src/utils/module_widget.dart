import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router_modular/go_router_modular.dart';

abstract class ModuleWidget extends StatelessWidget {
  Widget get view;
  Widget get pendingView => const SizedBox.shrink();

  FutureOr<List<Module>> imports() => [];
  FutureOr<List<Bind<Object>>> binds() => [];

  late final _WidgetModule _fakeModule = _WidgetModule(
    binds: binds(),
    imports: imports(),
  );

  ModuleWidget({super.key});

  void dispose() {
    _fakeModule.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ModularProvider(
      module: _fakeModule,
      child: view,
      pendingView: pendingView,
    );
  }
}

class _WidgetModule extends Module {
  final FutureOr<List<Bind<Object>>> _binds;
  final FutureOr<List<Module>> _imports;

  _WidgetModule({
    required FutureOr<List<Bind<Object>>> binds,
    FutureOr<List<Module>> imports = const [],
  }) : _binds = binds,
       _imports = imports;

  @override
  FutureOr<List<Bind<Object>>> binds() => _binds;

  @override
  FutureOr<List<Module>> imports() => _imports;
}

class ModularProvider extends StatefulWidget {
  final Module module;
  final Widget child;
  final Widget pendingView;

  const ModularProvider({
    super.key,
    required this.child,
    required this.module,
    required this.pendingView,
  });

  @override
  // ignore: library_private_types_in_public_api
  _ModularProviderState createState() => _ModularProviderState();
}

class _ModularProviderState extends State<ModularProvider> {
  bool _pending = true;

  @override
  void initState() {
    super.initState();
    _loadBinds();
  }

  _loadBinds() async {
    try {
      await RouteManager.instance.registerBindsModule(widget.module);

      setState(() {
        _pending = false;
      });
    } catch (e) {
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_pending) {
      return widget.pendingView;
    }
    return widget.child;
  }

  @override
  void dispose() {
    super.dispose();
    RouteManager.instance.unregisterModule(widget.module);
    widget.module.dispose();
  }
}
