import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:note_app/Screens/Note_Page.dart';
import 'package:note_app/Screens/detales_page_note.dart';
import 'package:note_app/Screens/welcom_page.dart';
import 'package:note_app/generated/l10n.dart';

void main() {
  runApp(MyApp());
}

class Routes {
  static String note = 'note';
  static String splash = 'splash';
  static String detales_page_note = 'detales_page_note';
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,

      debugShowCheckedModeBanner: false,

      //home: NotePage(),
      routes: {
        Routes.splash: (context) => WelcomPage(),
        Routes.detales_page_note: (context) => DetalesPageNote(),
        Routes.note: (context) => NotePage(),
      },
      home: WelcomPage(),
    );
  }
}
