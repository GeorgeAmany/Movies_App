import 'package:flutter/material.dart';
import 'package:movie_app/utils/constants.dart';

import 'screens/movies_app/view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    MaterialColor msThemeColor =
        MaterialColor(kThemeColour.value, const <int, Color>{
      50: kThemeColour,
      100: kThemeColour,
      200: kThemeColour,
      300: kThemeColour,
      400: kThemeColour,
      500: kThemeColour,
      600: kThemeColour,
      700: kThemeColour,
      800: kThemeColour,
      900: kThemeColour,
    });
    return MaterialApp(
      theme: ThemeData(
        primaryColor: kThemeColour,
        primarySwatch: msThemeColor,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
      ),
      debugShowCheckedModeBanner: false,
      home: const MoviesApp(),
    );
  }
}
