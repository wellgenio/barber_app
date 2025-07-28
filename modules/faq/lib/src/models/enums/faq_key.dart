enum FaqKey {
  faqCenter('faq_center'),
  jao('jao');

  final String label;

  const FaqKey(this.label);

  static FaqKey fromLabel(String label) {
    return FaqKey.values.firstWhere(
      (e) => e.label == label,
      orElse: () => throw ArgumentError('Invalid FAQ key: $label'),
    );
  }
}
