import 'package:shared/shared.dart';

part 'login_model.freezed.dart';
part 'login_model.g.dart';

@freezed
abstract class LoginModel with _$LoginModel {
  const factory LoginModel({required String email, required String password}) =
      _LoginModel;

  factory LoginModel.fromJson(Map<String, Object?> json) =>
      _$LoginModelFromJson(json);
}

final loginSchema = {'email': Zod().email(), 'password': Zod().password()};

extension LoginModelExtension on LoginModel {
  String? validate() {
    final result = Zod.validate(data: toJson(), params: loginSchema);
    if (result.isNotValid) {
      final messages = result.result.values
          .where((msg) => msg != null && msg.toString().trim().isNotEmpty)
          .map((msg) => msg.toString())
          .toList();
      return messages.isNotEmpty ? messages.join('\n') : null;
    }
    return null;
  }
}
