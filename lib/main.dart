import 'package:flutter/material.dart';
import 'package:requestexemple/ui/view/pages/listPresets/ListPresetsScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Request Example',
      theme: ThemeData(primaryColor: Colors.orange),
      routes: {
        //'/': (context) => const Splash(),
        '/': (context) => const ListPresets(),
        //'/welcome': (context) => const Welcome(),
        //'/list': (context) => const ListPresets(),
      },
    );
  }
}
