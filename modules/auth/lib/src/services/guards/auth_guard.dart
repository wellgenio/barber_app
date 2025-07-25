import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

import '../../data/repositories/auth_repository.dart';

typedef GoRouterGuard =
    String? Function(BuildContext context, GoRouterState state);

/// Cria um [GoRouterGuard] que verifica se o usuário está autenticado.
/// Se não estiver autenticado, redireciona para a rota especificada.
/// Caso contrário, permite o acesso à rota solicitada.
/// Este guard deve ser usado em rotas que requerem autenticação.
/// O parâmetro [redirectTo] define para onde o usuário será redirecionado se não estiver autenticado.
/// Esse guard pode e deve ser utilizado por outros módulos.
GoRouterGuard authGuard(GoPath redirectTo) =>
    (BuildContext context, GoRouterState state) {
      final isAuthenticated = context.read<AuthRepository>().isAuthenticated;

      if (!isAuthenticated) {
        return redirectTo.path;
      }
      return null;
    };
