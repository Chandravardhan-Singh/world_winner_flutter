import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:world_winner_flutter/app.dart';

// ignore: unused_import
import 'package:world_winner_flutter/extensions/string.dart';
// import 'package:world_winner_flutter/extensions/color.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

final theme = ThemeData(
  useMaterial3: false,
  colorScheme: const ColorScheme.light(
      primary: Color.fromRGBO(255, 88, 0, 1),
      secondary: Color.fromRGBO(16, 34, 110, 1),
      tertiary: Color.fromRGBO(255, 217, 1, 1),
      error: Color.fromRGBO(241, 54, 65, 1),
      background: Colors.white),
);
void main() {
  runApp(MaterialApp(
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
    theme: theme,
    home: const App(),
  ));
}
