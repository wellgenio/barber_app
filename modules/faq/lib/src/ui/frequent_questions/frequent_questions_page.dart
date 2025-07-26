import 'package:faq/src/models/enums/faq_key.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

import 'frequent_questions_viewmodel.dart';
import 'widgets/custom_collapsable.dart';

class FrequentQuestionsPage extends StatefulWidget {
  const FrequentQuestionsPage({
    super.key,
    required this.viewModel,
    required this.faqKey,
  });

  final FrequentQuestionsViewmodel viewModel;
  final FaqKey faqKey;

  @override
  State<FrequentQuestionsPage> createState() => _FrequentQuestionsPageState();
}

class _FrequentQuestionsPageState extends State<FrequentQuestionsPage> {
  FrequentQuestionsViewmodel get viewModel => widget.viewModel;

  @override
  void initState() {
    super.initState();
    viewModel.getFrequentQuestionsCommand.execute(widget.faqKey);
    viewModel.getFrequentQuestionsCommand.addListener(listener);
  }

  @override
  void didUpdateWidget(covariant FrequentQuestionsPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.faqKey != widget.faqKey) {
      viewModel.getFrequentQuestionsCommand.execute(widget.faqKey);
      viewModel.getFrequentQuestionsCommand.addListener(listener);
    }
  }

  void listener() {
    if (viewModel.getFrequentQuestionsCommand.value is FailureCommand &&
        mounted) {
      context.pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Não foi possível carregar as perguntas frequentes.'),
        ),
      );
    }
  }

  @override
  void dispose() {
    viewModel.getFrequentQuestionsCommand.removeListener(listener);
    viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Frequent Questions'),
        centerTitle: true,
      ),
      body: ValueListenableBuilder(
        valueListenable: viewModel.getFrequentQuestionsCommand,
        builder: (context, state, child) {
          if (state.isRunning) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state case SuccessCommand(value: final faq)) {
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 100,
                      horizontal: 16,
                    ),
                    child: Text(
                      'Frequent Questions - ${faq.title}',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final question = faq.questions[index];
                      return CustomCollapsable(
                        key: ValueKey(question.id),
                        indicatorIconSize: 24.0,
                        expanded: false,
                        initExpanded: false,
                        padding: EdgeInsets.symmetric(
                          vertical: 12.0,
                          horizontal: 16.0,
                        ),
                        headerContent: CustomCollapsableHeaderContent.withText(
                          context: context,
                          header: Text(question.question),
                        ),
                        body: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(question.answer),
                        ),
                      );
                    },
                    childCount:
                        faq.questions.length, // Número de perguntas frequentes
                  ),
                ),
                SliverToBoxAdapter(child: SizedBox(height: 100)),
              ],
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}
