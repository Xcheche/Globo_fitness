import 'package:flutter/material.dart';
import 'package:globo_fitness/bmi_screen.dart';

import 'screens/intro_screen.dart';

void main() {
  runApp(const GlobeApp());
}

class GlobeApp extends StatelessWidget {
  const GlobeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const IntroScreen(),
        '/bmi': (context) => const BmiScreen(),
      },
      initialRoute: '/',
    );
  }
}
