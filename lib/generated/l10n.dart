// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `My Notes`
  String get title {
    return Intl.message('My Notes', name: 'title', desc: '', args: []);
  }

  /// `Add New`
  String get add {
    return Intl.message('Add New', name: 'add', desc: '', args: []);
  }

  /// `No notes yet Tap + to add one`
  String get backNote {
    return Intl.message(
      'No notes yet Tap + to add one',
      name: 'backNote',
      desc: '',
      args: [],
    );
  }

  /// `Note Title`
  String get NoteTitle {
    return Intl.message('Note Title', name: 'NoteTitle', desc: '', args: []);
  }

  /// `Note Content`
  String get NoteContent {
    return Intl.message(
      'Note Content',
      name: 'NoteContent',
      desc: '',
      args: [],
    );
  }

  /// `Add Note`
  String get addNote {
    return Intl.message('Add Note', name: 'addNote', desc: '', args: []);
  }

  /// `My Notes`
  String get titleDetails {
    return Intl.message('My Notes', name: 'titleDetails', desc: '', args: []);
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `language`
  String get language {
    return Intl.message('language', name: 'language', desc: '', args: []);
  }

  /// `Organize Your Thoughts`
  String get title_splash1 {
    return Intl.message(
      'Organize Your Thoughts',
      name: 'title_splash1',
      desc: '',
      args: [],
    );
  }

  /// `Capture ideas our intuitive note-taking app`
  String get description_splash1 {
    return Intl.message(
      'Capture ideas our intuitive note-taking app',
      name: 'description_splash1',
      desc: '',
      args: [],
    );
  }

  /// `Stay Productive`
  String get title_splash2 {
    return Intl.message(
      'Stay Productive',
      name: 'title_splash2',
      desc: '',
      args: [],
    );
  }

  /// `Manage notes in one beautiful interface`
  String get description_splash2 {
    return Intl.message(
      'Manage notes in one beautiful interface',
      name: 'description_splash2',
      desc: '',
      args: [],
    );
  }

  /// `Sync Across Devices`
  String get title_splash3 {
    return Intl.message(
      'Sync Across Devices',
      name: 'title_splash3',
      desc: '',
      args: [],
    );
  }

  /// `Access your notes anywhere, anytime`
  String get description_splash3 {
    return Intl.message(
      'Access your notes anywhere, anytime',
      name: 'description_splash3',
      desc: '',
      args: [],
    );
  }

  /// `Get Started`
  String get title_splash4 {
    return Intl.message(
      'Get Started',
      name: 'title_splash4',
      desc: '',
      args: [],
    );
  }

  /// `Begin your journey to better organization`
  String get description_splash4 {
    return Intl.message(
      'Begin your journey to better organization',
      name: 'description_splash4',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get Skip {
    return Intl.message('Skip', name: 'Skip', desc: '', args: []);
  }

  /// `Next`
  String get Next {
    return Intl.message('Next', name: 'Next', desc: '', args: []);
  }

  /// `Start`
  String get Start {
    return Intl.message('Start', name: 'Start', desc: '', args: []);
  }

  /// `Update`
  String get update {
    return Intl.message('Update', name: 'update', desc: '', args: []);
  }

  /// `Please enter a title`
  String get EnterTitle {
    return Intl.message(
      'Please enter a title',
      name: 'EnterTitle',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a content`
  String get EnterContent {
    return Intl.message(
      'Please enter a content',
      name: 'EnterContent',
      desc: '',
      args: [],
    );
  }

  /// `Created At`
  String get createdAt {
    return Intl.message('Created At', name: 'createdAt', desc: '', args: []);
  }

  /// `Updated At`
  String get updatedAt {
    return Intl.message('Updated At', name: 'updatedAt', desc: '', args: []);
  }

  /// `at`
  String get at {
    return Intl.message('at', name: 'at', desc: '', args: []);
  }

  /// `Note Options`
  String get noteOptions {
    return Intl.message(
      'Note Options',
      name: 'noteOptions',
      desc: '',
      args: [],
    );
  }

  /// `What would you like to do with this note?`
  String get optionsTile {
    return Intl.message(
      'What would you like to do with this note?',
      name: 'optionsTile',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get Edit {
    return Intl.message('Edit', name: 'Edit', desc: '', args: []);
  }

  /// `Delete`
  String get Delete {
    return Intl.message('Delete', name: 'Delete', desc: '', args: []);
  }

  /// `Cancel`
  String get Cancel {
    return Intl.message('Cancel', name: 'Cancel', desc: '', args: []);
  }

  /// `m ago`
  String get m_ago {
    return Intl.message('m ago', name: 'm_ago', desc: '', args: []);
  }

  /// `h ago`
  String get h_ago {
    return Intl.message('h ago', name: 'h_ago', desc: '', args: []);
  }

  /// `d ago`
  String get d_ago {
    return Intl.message('d ago', name: 'd_ago', desc: '', args: []);
  }

  /// `Yesterday`
  String get Yesterday {
    return Intl.message('Yesterday', name: 'Yesterday', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
