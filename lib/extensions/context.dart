import 'package:flutter/cupertino.dart';
import "package:flutter_gen/gen_l10n/app_localization.dart";

extension Localext on BuildContext {
  AppLocalizations? get localization => AppLocalizations.of(this);
}
