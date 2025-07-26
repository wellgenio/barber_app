import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

import '../../data/repositories/faq_repository.dart';
import '../../models/enums/faq_key.dart';
import '../../models/response/frequent_question_model.dart';

class FrequentQuestionsViewmodel extends ChangeNotifier {
  final FaqRepository _faqRepository;

  FrequentQuestionsViewmodel(this._faqRepository);

  late final getFrequentQuestionsCommand =
      Command1<FrequentQuestionModel, FaqKey>(
        _faqRepository.getFrequentQuestions,
      );

  @override
  void dispose() {
    getFrequentQuestionsCommand.dispose();
    super.dispose();
  }
}
