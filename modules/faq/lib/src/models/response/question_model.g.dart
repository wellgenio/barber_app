// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QuestionModel _$QuestionModelFromJson(Map<String, dynamic> json) =>
    _QuestionModel(
      id: json['id'] as String,
      question: json['question'] as String,
      answer: json['answer'] as String,
    );

Map<String, dynamic> _$QuestionModelToJson(_QuestionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
      'answer': instance.answer,
    };
