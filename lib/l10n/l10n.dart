import 'package:flutter/widgets.dart';
import 'package:tsl_flutter_template/l10n/gen/app_localizations.dart';

export 'package:tsl_flutter_template/l10n/gen/app_localizations.dart';

extension AppLocalizationsX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}
