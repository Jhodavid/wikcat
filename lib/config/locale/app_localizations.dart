import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'locale/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es')
  ];

  /// No description provided for @app_name.
  ///
  /// In es, this message translates to:
  /// **'WikCat'**
  String get app_name;

  /// No description provided for @no_image_found.
  ///
  /// In es, this message translates to:
  /// **'No se encontrarón imágenes.'**
  String get no_image_found;

  /// No description provided for @breeds_default.
  ///
  /// In es, this message translates to:
  /// **'Módulo de razas'**
  String get breeds_default;

  /// No description provided for @breeds_title.
  ///
  /// In es, this message translates to:
  /// **'Razas de gatos'**
  String get breeds_title;

  /// No description provided for @breeds_search_input_hint.
  ///
  /// In es, this message translates to:
  /// **'Buscar una raza de gato'**
  String get breeds_search_input_hint;

  /// No description provided for @breeds_read_more.
  ///
  /// In es, this message translates to:
  /// **'Leer más'**
  String get breeds_read_more;

  /// No description provided for @breeds_intelligence.
  ///
  /// In es, this message translates to:
  /// **'Inteligencia'**
  String get breeds_intelligence;

  /// No description provided for @breeds_intelligence_tooltip_message.
  ///
  /// In es, this message translates to:
  /// **'[rate] de [total]'**
  String get breeds_intelligence_tooltip_message;

  /// No description provided for @breeds_search_cat_breeds.
  ///
  /// In es, this message translates to:
  /// **'Buscando razas de gatos...'**
  String get breeds_search_cat_breeds;

  /// No description provided for @breeds_network_error.
  ///
  /// In es, this message translates to:
  /// **'Error al consultar las razas de gatos, compruebe su conexión a internet. O, Haz alcanzado el límite de tarifa en The Cat Api, por favor aumente el nivel del paquete de su cuenta o espere un minuto.'**
  String get breeds_network_error;

  /// No description provided for @breeds_no_result.
  ///
  /// In es, this message translates to:
  /// **'Sin resultados.'**
  String get breeds_no_result;

  /// No description provided for @breeds_refresh.
  ///
  /// In es, this message translates to:
  /// **'Refresh'**
  String get breeds_refresh;

  /// No description provided for @detail_default.
  ///
  /// In es, this message translates to:
  /// **'Módulo de detalle'**
  String get detail_default;

  /// No description provided for @detail_country_origin.
  ///
  /// In es, this message translates to:
  /// **'País de origen:'**
  String get detail_country_origin;

  /// No description provided for @detail_lifetime.
  ///
  /// In es, this message translates to:
  /// **'Tiempo de vida:'**
  String get detail_lifetime;

  /// No description provided for @detail_years.
  ///
  /// In es, this message translates to:
  /// **'años:'**
  String get detail_years;

  /// No description provided for @detail_weight.
  ///
  /// In es, this message translates to:
  /// **'Peso:'**
  String get detail_weight;

  /// No description provided for @detail_characteristics_tooltip_message.
  ///
  /// In es, this message translates to:
  /// **'[rate] de [total]'**
  String get detail_characteristics_tooltip_message;

  /// No description provided for @detail_characteristics_title.
  ///
  /// In es, this message translates to:
  /// **'Características'**
  String get detail_characteristics_title;

  /// No description provided for @detail_characteristic_adaptability.
  ///
  /// In es, this message translates to:
  /// **'Adaptabilidad'**
  String get detail_characteristic_adaptability;

  /// No description provided for @detail_characteristic_affection_level.
  ///
  /// In es, this message translates to:
  /// **'Nivel de afecto'**
  String get detail_characteristic_affection_level;

  /// No description provided for @detail_characteristic_child_friendly.
  ///
  /// In es, this message translates to:
  /// **'Apto para niños'**
  String get detail_characteristic_child_friendly;

  /// No description provided for @detail_characteristic_dog_friendly.
  ///
  /// In es, this message translates to:
  /// **'Admite perros'**
  String get detail_characteristic_dog_friendly;

  /// No description provided for @detail_characteristic_energy_level.
  ///
  /// In es, this message translates to:
  /// **'Nivel de energía'**
  String get detail_characteristic_energy_level;

  /// No description provided for @detail_characteristic_grooming.
  ///
  /// In es, this message translates to:
  /// **'Aseo'**
  String get detail_characteristic_grooming;

  /// No description provided for @detail_characteristic_health_issues.
  ///
  /// In es, this message translates to:
  /// **'Saludable'**
  String get detail_characteristic_health_issues;

  /// No description provided for @detail_characteristic_intelligence.
  ///
  /// In es, this message translates to:
  /// **'Inteligencia'**
  String get detail_characteristic_intelligence;

  /// No description provided for @detail_characteristic_shedding_level.
  ///
  /// In es, this message translates to:
  /// **'Nivel de desprendimiento'**
  String get detail_characteristic_shedding_level;

  /// No description provided for @detail_characteristic_social_needs.
  ///
  /// In es, this message translates to:
  /// **'Necesidades sociales'**
  String get detail_characteristic_social_needs;

  /// No description provided for @detail_characteristic_stranger_friendly.
  ///
  /// In es, this message translates to:
  /// **'Amigable con los extraños'**
  String get detail_characteristic_stranger_friendly;

  /// No description provided for @detail_characteristic_vocalisation.
  ///
  /// In es, this message translates to:
  /// **'Vocalización'**
  String get detail_characteristic_vocalisation;

  /// No description provided for @detail_characteristic_experimental.
  ///
  /// In es, this message translates to:
  /// **'Experimental'**
  String get detail_characteristic_experimental;

  /// No description provided for @detail_characteristic_hairless.
  ///
  /// In es, this message translates to:
  /// **'Sin pelo'**
  String get detail_characteristic_hairless;

  /// No description provided for @detail_characteristic_natural.
  ///
  /// In es, this message translates to:
  /// **'Natural'**
  String get detail_characteristic_natural;

  /// No description provided for @detail_characteristic_rare.
  ///
  /// In es, this message translates to:
  /// **'Raro'**
  String get detail_characteristic_rare;

  /// No description provided for @detail_characteristic_rex.
  ///
  /// In es, this message translates to:
  /// **'Rex'**
  String get detail_characteristic_rex;

  /// No description provided for @detail_characteristic_suppressed_tail.
  ///
  /// In es, this message translates to:
  /// **'Cola suprimida'**
  String get detail_characteristic_suppressed_tail;

  /// No description provided for @detail_characteristic_short_legs.
  ///
  /// In es, this message translates to:
  /// **'Piernas cortas'**
  String get detail_characteristic_short_legs;

  /// No description provided for @detail_characteristic_hypoallergenic.
  ///
  /// In es, this message translates to:
  /// **'Hipoalergénico'**
  String get detail_characteristic_hypoallergenic;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'es': return AppLocalizationsEs();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
