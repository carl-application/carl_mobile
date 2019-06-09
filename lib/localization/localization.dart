import 'dart:async';

import 'package:carl/localization/localization_strings.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Localization {
  final Locale locale;

  Localization(this.locale);

  static Localization of(BuildContext context) {
    return Localizations.of<Localization>(context, Localization);
  }

  static Map<String, Map<String, String>> _localizedValues = {'fr': fr, 'en': en};

  _getValue(String key) => _localizedValues[locale.languageCode][key];

  String get welcomePageTitle => _getValue(WelcomePageTitle);

  String get welcomePageSubtitle => _getValue(WelcomePageSubtitle);

  String get welcomePageLoginButtonLabel => _getValue(WelcomePageLoginButtonLabel);

  String get welcomePageRegisterButtonLabel => _getValue(WelcomePageRegisterButtonLabel);

  String get onBoardingUsernameTitle => _getValue(OnBoardingUserNameTitle);

  String get onBoardingUsernameHint => _getValue(OnBoardingUserNameHint);

  String get onBoardingUsernameLabel => _getValue(OnBoardingUserNameLabel);

  String get onBoardingEmailTitle => _getValue(OnBoardingEmailTitle);

  String get onBoardingEmailHint => _getValue(OnBoardingEmailHint);

  String get onBoardingEmailLabel => _getValue(OnBoardingEmailLabel);

  String get onBoardingPasswordTitle => _getValue(OnBoardingPasswordTitle);

  String get onBoardingPasswordHint => _getValue(OnBoardingPasswordHint);

  String get onBoardingPasswordLabel => _getValue(OnBoardingPasswordLabel);

  String get onBoardingSexAndAgeTitle => _getValue(OnBoardingSexAndAgeTitle);

  String get yourSexLabel => _getValue(YourSex);

  String get man => _getValue(Man);

  String get woman => _getValue(Woman);

  String get np => _getValue(NP);

  String get getBirthdayLabel => _getValue(GetBirthdayLabel);

  List<String> get getMonths => [
        _getValue(January),
        _getValue(February),
        _getValue(March),
        _getValue(April),
        _getValue(May),
        _getValue(June),
        _getValue(July),
        _getValue(August),
        _getValue(September),
        _getValue(October),
        _getValue(November),
        _getValue(December),
      ];

  List<String> get getWeekDays => [
        _getValue(Monday),
        _getValue(Tuesday),
        _getValue(Wednesday),
        _getValue(Thursday),
        _getValue(Friday),
        _getValue(Saturday),
        _getValue(Sunday),
      ];

  String get validate => _getValue(Validate);

  String get add => _getValue(Add);

  String get emptyCardsTitle => _getValue(EmptyCardsTitle);

  String get emptyCardsDescription => _getValue(EmptyCardsDescription);

  String get errorServerTitle => _getValue(ErrorServerTitle);

  String get errorServerDescription => _getValue(ErrorServerDescription);

  String get visitsHistoricTitle => _getValue(VisitsHistoricTitle);

  String get at => _getValue(At);

  String get emptyGoodDealsTitle => _getValue(EmptyGoodDealsTitle);

  String get emptyGoodDealsDescription => _getValue(EmptyGoodDealsDescription);

  String get networkErrorTitle => _getValue(NetworkErrorTitle);

  String get networkErrorDescription => _getValue(NetworkErrorDescription);

  String get goodDealsTitle => _getValue(GoodDealsTitle);

  String get loginPageTitle => _getValue(LoginPageTitle);

  String get loginPageEmailHintText => _getValue(LoginPageEmailHintText);

  String get loginPagePasswordHintText => _getValue(LoginPagePasswordHintText);

  String get loginPageBadCredentialsErrorText => _getValue(LoginPageBadCredentialsErrorText);

  String get emailAlreadyExistErrorMessage => _getValue(EmailAlreadyExistErrorMessage);

  String get settingsTitle => _getValue(SettingsTitle);

  String get settingsLogoutLabel => _getValue(SettingsLogoutLabel);

  String get logOutConfirmationTitle => _getValue(LogOutConfirmationTitle);

  String get logOutConfirmationDescription => _getValue(LogOutConfirmationDescription);

  String get cancel => _getValue(Cancel);

  String get scanPageTitle => _getValue(ScanPageTitle);

  String get activate => _getValue(Activate);

  String get newNotificationLabel => _getValue(New);

}

class LocalizationDelegate extends LocalizationsDelegate<Localization> {
  const LocalizationDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'fr'].contains(locale.languageCode);

  @override
  Future<Localization> load(Locale locale) {
    // Returning a SynchronousFuture here because an async "load" operation
    // isn't needed to produce an instance of Localization.
    return SynchronousFuture<Localization>(Localization(locale));
  }

  @override
  bool shouldReload(LocalizationDelegate old) => false;
}
