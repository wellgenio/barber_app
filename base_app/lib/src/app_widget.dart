import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:design/design.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().config(constraints, orientation);

            ThemeFactory.buildDefaultTheme(brightness: Brightness.dark);

            final themeDark = AppTheme.instance.get(
              ThemeType.standard,
              brightness: Brightness.dark,
            );

            final themeLight = AppTheme.instance.get(
              ThemeType.standard,
              brightness: Brightness.light,
            );

            return MaterialApp.router(
              routerConfig: Modular.routerConfig,
              builder: (context, child) {
                return ModularLoader.builder(context, child);
              },
              title: 'Modular GoRoute Example',
              theme: themeLight,
              darkTheme: themeDark,
              themeMode: ThemeMode.dark,

              debugShowCheckedModeBanner: false,
            );
          },
        );
      },
    );
  }
}
