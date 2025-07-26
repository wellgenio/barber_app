import 'package:shared/shared.dart';

import '../../models/enums/faq_key.dart';
import '../../models/response/frequent_question_model.dart';
import '../local/faq_local.dart';

class FaqRepository {
  final FaqLocal _faqLocal;

  FaqRepository(this._faqLocal);

  AsyncResult<FrequentQuestionModel> getFrequentQuestions(FaqKey key) async {
    try {
      final result = await _faqLocal.readFaq(key);
      return Success(result);
    } catch (e) {
      return Failure(Exception('Failed to load FAQ: $e'));
    }
  }
}
