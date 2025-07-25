import 'package:shared/shared.dart';

import '../../local/auth_local.dart';

class AuthInterceptor extends Interceptor {
  final AuthLocal _authLocal;

  const AuthInterceptor(this._authLocal);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await _authLocal.getAccessToken().fold(
      (token) => 'Bearer $token',
      (error) => '',
    );

    if (token.isNotEmpty) {
      options.headers['Authorization'] = token;
    }

    super.onRequest(options, handler);
  }
}
