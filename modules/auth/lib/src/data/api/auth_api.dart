import 'package:shared/shared.dart';

import '../../models/request/login_model.dart';
import '../../models/response/session_model.dart';

part 'auth_api.g.dart';

@RestApi(baseUrl: '/auth')
abstract class AuthApi {
  factory AuthApi(Dio dio, {String? baseUrl}) = _AuthApi;

  // @POST('/register')
  // Future<ResponseUserModel> register(@Body() RegisterDto dto);

  @POST('/login')
  Future<SessionModel> login(@Body() LoginModel dto);

  // @POST('/logout')
  // Future<void> logout();

  // @POST('/refresh')
  // Future<ResponseAccessTokenModel> refresh();

  // @GET('/me')
  // Future<ResponseUserModel> me();
}
