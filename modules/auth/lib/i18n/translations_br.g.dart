///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'translations.g.dart';

// Path: <root>
class TranslationsBr implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsBr({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.br,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <br>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsBr _root = this; // ignore: unused_field

	@override 
	TranslationsBr $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsBr(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsLoginPageBr loginPage = _TranslationsLoginPageBr._(_root);
}

// Path: loginPage
class _TranslationsLoginPageBr implements TranslationsLoginPageEn {
	_TranslationsLoginPageBr._(this._root);

	final TranslationsBr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Login';
	@override String get description => 'Por favor, insira suas credenciais para fazer login.';
	@override String get emailLabel => 'Email';
	@override String get passwordLabel => 'Senha';
	@override String get loginButton => 'Entrar';
	@override String get registerButton => 'Cadastrar';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsBr {
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

