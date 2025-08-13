import 'dart:async';

import 'package:faq/src/data/repositories/faq_repository.dart';
import 'package:faq/src/faq_route.dart';
import 'package:faq/src/ui/frequent_questions/frequent_questions_viewmodel.dart';
import 'package:shared/shared.dart';

import 'data/local/faq_local.dart';
import 'ui/events/show_faq_event.dart';

class FaqModule extends EventModule {
  GoPath? parent;

  FaqModule([this.parent]) {
    listen();
  }

  @override
  void listen() {
    on<ShowFaqEvent>((event, context) {
      context?.push(
        FaqRoute().frequentQuestion.withPathParamsMap({
          'key': event.faqKey.label,
        }).completePath,
      );
    }, autoDispose: false);
  }

  @override
  FutureOr<List<Bind<Object>>> binds() => [
    Bind.singleton<FaqRepository>((i) => FaqRepository(FaqLocal())),
    Bind.factory<FrequentQuestionsViewmodel>(
      (i) => FrequentQuestionsViewmodel(i.get<FaqRepository>()),
    ),
  ];

  @override
  List<ModularRoute> get routes => FaqRoute(parent).routes;
}
