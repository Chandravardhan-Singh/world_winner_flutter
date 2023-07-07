import 'package:flutter/material.dart';

import 'package:world_winner_flutter/pages/landing-page/landing_page.dart';

// ignore: unused_import
import 'package:world_winner_flutter/extensions/string.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

void main() {
  runApp(const MaterialApp(
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
    home: LandingPage(),
  ));
}
