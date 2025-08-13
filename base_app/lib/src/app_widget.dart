import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared/shared.dart' hide Locale;
import 'package:design/design.dart';

import '../i18n/translations.g.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeFactory.buildDefaultTheme(brightness: Brightness.dark);

    final themeDark = AppTheme.instance.get(
      ThemeType.standard,
      brightness: Brightness.dark,
    );

    final themeLight = AppTheme.instance.get(
      ThemeType.standard,
      brightness: Brightness.light,
    );

    return StreamBuilder(
      stream: LocaleSettings.getLocaleStream(),
      builder: (context, snapshot) {
        GlobalLangManager.instance.setlocale(
          LocaleSettings.currentLocale.flutterLocale,
        );

        return MaterialApp.router(
          routerConfig: Modular.routerConfig,
          locale: LocaleSettings.currentLocale.flutterLocale,
          supportedLocales: AppLocaleUtils.supportedLocales,
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          builder: (context, child) {
            return LayoutBuilder(
              builder: (context, constraints) {
                return OrientationBuilder(
                  builder: (context, orientation) {
                    SizeConfig().config(constraints, orientation);
                    return ModularLoader.builder(context, child);
                  },
                );
              },
            );
          },
          title: 'Modular GoRoute Example',
          theme: themeLight,
          darkTheme: themeDark,
          themeMode: ThemeMode.dark,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
