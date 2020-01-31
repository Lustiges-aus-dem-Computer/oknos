import 'dart:async';
import 'package:flutter/material.dart';

/// List of possible app-texts
enum AppTexts {
  /// Name of the app
  appTitle
}

/// Class for handling localizations in the app
class FlutterBlocLocalizations {
  /// Localizer
  final Locale locale;

  /// Constructor taking the localizer instance
  FlutterBlocLocalizations(this.locale);

  /// Returns the localizer based on the BuildContext
  static FlutterBlocLocalizations of(BuildContext context) {
    return Localizations.of<FlutterBlocLocalizations>(
      context,
      FlutterBlocLocalizations,
    );
  }

  static final Map<String, Map<AppTexts, String>> _localizedValues = {
    'en': {
      AppTexts.appTitle: 'Oknos',
    },
    'de': {
      AppTexts.appTitle: 'Oknos',
    },
  };

  /// Return the title of the app
  String get appTitle {
    return _localizedValues[locale.languageCode][AppTexts.appTitle];
  }
}

/// Delegate handling construction of FlutterBlocLocalization instances
class FlutterBlocLocalizationsDelegate
    extends LocalizationsDelegate<FlutterBlocLocalizations> {
  @override
  Future<FlutterBlocLocalizations> load(Locale locale) =>
      Future(() => FlutterBlocLocalizations(locale));

  @override
  bool shouldReload(FlutterBlocLocalizationsDelegate old) => false;

  // We currently support both english and german
  @override
  bool isSupported(Locale locale) {
    return locale.languageCode.toLowerCase().contains('de') ||
        locale.languageCode.toLowerCase().contains('en');
  }
}
