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

  String get deleteReservedTitle {
    if (locale.languageCode == 'en') {
      return UiTextEn().deleteReservedTitle;
    } else if (locale.languageCode == 'es') {
      return UiTextEs().deleteReservedTitle;
    } else {
      return UiTextEn().deleteReservedTitle;
    }
  }

  String get deleteReservedContent {
    if (locale.languageCode == 'en') {
      return UiTextEn().deleteReservedContent;
    } else if (locale.languageCode == 'es') {
      return UiTextEs().deleteReservedContent;
    } else {
      return UiTextEn().deleteReservedContent;
    }
  }

  String get deleteReservedButton1 {
    if (locale.languageCode == 'en') {
      return UiTextEn().deleteReservedButton1;
    } else if (locale.languageCode == 'es') {
      return UiTextEs().deleteReservedButton1;
    } else {
      return UiTextEn().deleteReservedButton1;
    }
  }

  String get deleteReservedButton2 {
    if (locale.languageCode == 'en') {
      return UiTextEn().deleteReservedButton2;
    } else if (locale.languageCode == 'es') {
      return UiTextEs().deleteReservedButton2;
    } else {
      return UiTextEn().deleteReservedButton2;
    }
  }

  String get getWeatherTitle {
    if (locale.languageCode == 'en') {
      return UiTextEn().getWeatherTitle;
    } else if (locale.languageCode == 'es') {
      return UiTextEs().getWeatherTitle;
    } else {
      return UiTextEn().getWeatherTitle;
    }
  }

  String get getWeatherContent {
    if (locale.languageCode == 'en') {
      return UiTextEn().getWeatherContent;
    } else if (locale.languageCode == 'es') {
      return UiTextEs().getWeatherContent;
    } else {
      return UiTextEn().getWeatherContent;
    }
  }

  String get getWeatherButton {
    if (locale.languageCode == 'en') {
      return UiTextEn().getWeatherButton;
    } else if (locale.languageCode == 'es') {
      return UiTextEs().getWeatherButton;
    } else {
      return UiTextEn().getWeatherButton;
    }
  }

  String get getWeatherChanceOfRain {
    if (locale.languageCode == 'en') {
      return UiTextEn().getWeatherChanceOfRain;
    } else if (locale.languageCode == 'es') {
      return UiTextEs().getWeatherChanceOfRain;
    } else {
      return UiTextEn().getWeatherChanceOfRain;
    }
  }

  String get getWeatherWillItRain {
    if (locale.languageCode == 'en') {
      return UiTextEn().getWeatherWillItRain;
    } else if (locale.languageCode == 'es') {
      return UiTextEs().getWeatherWillItRain;
    } else {
      return UiTextEn().getWeatherWillItRain;
    }
  }

  String get getWeatherWillItRainYes {
    if (locale.languageCode == 'en') {
      return UiTextEn().getWeatherWillItRainYes;
    } else if (locale.languageCode == 'es') {
      return UiTextEs().getWeatherWillItRainYes;
    } else {
      return UiTextEn().getWeatherWillItRainYes;
    }
  }

  String get getWeatherWillItRainNo {
    if (locale.languageCode == 'en') {
      return UiTextEn().getWeatherWillItRainNo;
    } else if (locale.languageCode == 'es') {
      return UiTextEs().getWeatherWillItRainNo;
    } else {
      return UiTextEn().getWeatherWillItRainNo;
    }
  }

  String get authorTitle {
    if (locale.languageCode == 'en') {
      return UiTextEn().authorTitle;
    } else if (locale.languageCode == 'es') {
      return UiTextEs().authorTitle;
    } else {
      return UiTextEn().authorTitle;
    }
  }

  String get authorButton {
    if (locale.languageCode == 'en') {
      return UiTextEn().authorButton;
    } else if (locale.languageCode == 'es') {
      return UiTextEs().authorButton;
    } else {
      return UiTextEn().authorButton;
    }
  }
}
