import 'package:shared/shared.dart';

part 'question_model.freezed.dart';
part 'question_model.g.dart';

@freezed
abstract class QuestionModel with _$QuestionModel {
  const factory QuestionModel({
    required String id,
    required String question,
    required String answer,
  }) = _QuestionModel;

  factory QuestionModel.fromJson(Map<String, Object?> json) =>
      _$QuestionModelFromJson(json);
}
