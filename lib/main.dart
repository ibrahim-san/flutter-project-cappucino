import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

final Map<int, Color> colorSwatch = {
  50: const Color(0xFFD5C9BC),
  100: const Color(0xFFC9B4A6),
  200: const Color(0xFFBE9E8F),
  300: const Color(0xFFB18878),
  400: const Color(0xFFA47361),
  500: const Color(0xFFC67C4E),
  600: const Color(0xFFB86D41),
  700: const Color(0xFFAA6034),
  800: const Color(0xFF9C5327),
  900: const Color(0xFF8E461A),
};

final MaterialColor myBrownColor = MaterialColor(0xFFAA6034, colorSwatch);

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Capuccino App",
      theme: ThemeData(primarySwatch: myBrownColor),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}