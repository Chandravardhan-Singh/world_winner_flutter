import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:world_winner_flutter/app.dart';

// ignore: unused_import
import 'package:world_winner_flutter/extensions/string.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

const FlexSchemeData theme = FlexSchemeData(
  name: 'Midnight blue',
  description: 'Midnight blue theme, custom definition of all colors',
  light: FlexSchemeColor(
      primary: Color.fromRGBO(255, 88, 0, 1),
      secondary: Color.fromRGBO(16, 34, 110, 1),
      tertiary: Color.fromRGBO(255, 217, 1, 1),
      error: Color.fromRGBO(241, 54, 65, 1)),
  dark: FlexSchemeColor(
      primary: Color.fromRGBO(255, 88, 0, 1),
      secondary: Color.fromRGBO(16, 34, 110, 1),
      tertiary: Color.fromRGBO(255, 217, 1, 1),
      error: Color.fromRGBO(241, 54, 65, 1)),
);

void main() {
  runApp(MaterialApp(
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
    home: const App(),
    theme: FlexThemeData.light(
      useMaterial3: false,
      colors: theme.light,
      subThemesData: const FlexSubThemesData(),
      appBarElevation: 1,
      visualDensity: VisualDensity.standard,
      // fontFamily: GoogleFonts.notoSans().fontFamily,
      typography: Typography.material2021(platform: defaultTargetPlatform),
    ),
    darkTheme: FlexThemeData.dark(
      useMaterial3: false,
      colors: theme.dark,
      subThemesData: const FlexSubThemesData(),
      appBarElevation: 1,
      visualDensity: VisualDensity.standard,
      // fontFamily: GoogleFonts.notoSans().fontFamily,
      typography: Typography.material2021(platform: defaultTargetPlatform),
    ),
  ));
}
