import 'package:shared/shared.dart';

import 'models/enums/faq_key.dart';
import 'ui/frequent_questions/frequent_questions_page.dart';
import 'ui/frequent_questions/frequent_questions_viewmodel.dart';

class FaqRoute {
  /// Parent module path
  GoPath? root;

  FaqRoute._();

  static final _singleton = FaqRoute._();

  factory FaqRoute([GoPath? root]) {
    if (root != null) {
      _singleton.root = root;
    }

    return _singleton;
  }

  GoPath get frequentQuestion =>
      GoPath(path: '/:key', name: 'frequent_question', root: root);

  /// Routes
  List<ModularRoute> get routes => [
    ChildRoute(
      frequentQuestion.path,
      child: (context, state) {
        final rawKey = state.pathParameters['key'];

        assert(rawKey != null, 'FAQ key must not be null');

        final key = FaqKey.fromLabel(rawKey!);
        final viewModel = context.read<FrequentQuestionsViewmodel>();

        return FrequentQuestionsPage(viewModel: viewModel, faqKey: key);
      },
      name: frequentQuestion.name,
    ),
  ];
}
