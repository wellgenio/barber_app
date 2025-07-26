// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'frequent_question_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FrequentQuestionModel _$FrequentQuestionModelFromJson(
  Map<String, dynamic> json,
) => _FrequentQuestionModel(
  title: json['title'] as String,
  questions: (json['questions'] as List<dynamic>)
      .map((e) => QuestionModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$FrequentQuestionModelToJson(
  _FrequentQuestionModel instance,
) => <String, dynamic>{
  'title': instance.title,
  'questions': instance.questions,
};
