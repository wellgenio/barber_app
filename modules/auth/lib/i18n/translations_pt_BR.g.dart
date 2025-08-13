///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

part of 'translations.g.dart';

// Path: <root>
typedef TranslationsPtBr = Translations; // ignore: unused_element
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ptBr,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <pt-BR>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations
	late final TranslationsLoginPagePtBr loginPage = TranslationsLoginPagePtBr._(_root);
}

// Path: loginPage
class TranslationsLoginPagePtBr {
	TranslationsLoginPagePtBr._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// pt-BR: 'Login'
	String get title => 'Login';

	/// pt-BR: 'Por favor, insira suas credenciais para fazer login.'
	String get description => 'Por favor, insira suas credenciais para fazer login.';

	/// pt-BR: 'Email'
	String get emailLabel => 'Email';

	/// pt-BR: 'Senha'
	String get passwordLabel => 'Senha';

	/// pt-BR: 'Entrar'
	String get loginButton => 'Entrar';

	/// pt-BR: 'Cadastrar'
	String get registerButton => 'Cadastrar';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'loginPage.title': return 'Login';
			case 'loginPage.description': return 'Por favor, insira suas credenciais para fazer login.';
			case 'loginPage.emailLabel': return 'Email';
			case 'loginPage.passwordLabel': return 'Senha';
			case 'loginPage.loginButton': return 'Entrar';
			case 'loginPage.registerButton': return 'Cadastrar';
			default: return null;
		}
	}
}

