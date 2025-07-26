import 'package:faq/src/models/response/question_model.dart';
import 'package:shared/shared.dart';

part 'frequent_question_model.freezed.dart';
part 'frequent_question_model.g.dart';

@freezed
abstract class FrequentQuestionModel with _$FrequentQuestionModel {
  const factory FrequentQuestionModel({
    required String title,
    required List<QuestionModel> questions,
  }) = _FrequentQuestionModel;

  factory FrequentQuestionModel.fromJson(Map<String, Object?> json) =>
      _$FrequentQuestionModelFromJson(json);
}
