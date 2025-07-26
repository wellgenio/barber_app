import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../../models/enums/faq_key.dart';
import '../../models/response/frequent_question_model.dart';

class FaqLocal {
  static const _package = 'faq';

  Future<FrequentQuestionModel> readFaq(FaqKey key) async {
    final path = 'packages/$_package/assets/faq/${key.label}.json';
    final jsonString = await rootBundle.loadString(path);
    return FrequentQuestionModel.fromJson(json.decode(jsonString));
  }
}
