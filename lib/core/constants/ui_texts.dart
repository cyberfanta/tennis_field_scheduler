import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'lang/ui_text_en.dart';
import 'lang/ui_text_es.dart';

class UiTexts {
  UiTexts(this.locale);

  final Locale locale;

  static UiTexts? of(BuildContext context) {
    return Localizations.of<UiTexts>(context, UiTexts);
  }

  static Future<UiTexts> load(Locale locale) {
    return SynchronousFuture<UiTexts>(UiTexts(locale));
  }

  String get title {
    if (locale.languageCode == 'en') {
      return UiTextEn().title;
    } else if (locale.languageCode == 'es') {
      return UiTextEs().title;
    } else {
      return UiTextEn().title;
    }
  }

  String get leavingAppTitle {
    if (locale.languageCode == 'en') {
      return UiTextEn().leavingAppTitle;
    } else if (locale.languageCode == 'es') {
      return UiTextEs().leavingAppTitle;
    } else {
      return UiTextEn().leavingAppTitle;
    }
  }

  String get leavingAppContent {
    if (locale.languageCode == 'en') {
      return UiTextEn().leavingAppContent;
    } else if (locale.languageCode == 'es') {
      return UiTextEs().leavingAppContent;
    } else {
      return UiTextEn().leavingAppContent;
    }
  }

  String get leavingAppButton1 {
    if (locale.languageCode == 'en') {
      return UiTextEn().leavingAppButton1;
    } else if (locale.languageCode == 'es') {
      return UiTextEs().leavingAppButton1;
    } else {
      return UiTextEn().leavingAppButton1;
    }
  }

  String get leavingAppButton2 {
    if (locale.languageCode == 'en') {
      return UiTextEn().leavingAppButton2;
    } else if (locale.languageCode == 'es') {
      return UiTextEs().leavingAppButton2;
    } else {
      return UiTextEn().leavingAppButton2;
    }
  }

  String get errorLoading {
    if (locale.languageCode == 'en') {
      return UiTextEn().errorLoading;
    } else if (locale.languageCode == 'es') {
      return UiTextEs().errorLoading;
    } else {
      return UiTextEn().errorLoading;
    }
  }

  String get getDatesSubTitle {
    if (locale.languageCode == 'en') {
      return UiTextEn().getDatesSubTitle;
    } else if (locale.languageCode == 'es') {
      return UiTextEs().getDatesSubTitle;
    } else {
      return UiTextEn().getDatesSubTitle;
    }
  }
}
