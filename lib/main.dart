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
    return Scaffold(
      appBar: AppBar(
          title: const AppBarComponent(
              title: "Detail",
              firstImage: "images/arrow-left.jpg",
              secondImage: "images/Heart.jpg")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              child: Center(
                child: Image.asset("images/Rectangle 1706.jpg"),
              ),
            ),
            const MenuItem(
                description: "with Chocolate", foodItem: "Cappucino"),
          ],
        ),
      ),
    );
  }
}

class AppBarComponent extends StatelessWidget {
  const AppBarComponent(
      {super.key,
      required this.title,
      required this.firstImage,
      required this.secondImage});

  final String title;
  final String firstImage;
  final String secondImage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 85.0),
          child: Image.asset(firstImage),
        ),
        Text(
          title,
          style: const TextStyle(
              fontFamily: "Sora", fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 85.0),
          child: Image.asset(secondImage),
        )
      ],
    );
  }
}

class MenuItem extends StatelessWidget {
  const MenuItem(
      {super.key, required this.description, required this.foodItem});

  final String foodItem;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                foodItem,
                style: const TextStyle(
                    fontFamily: "Sora",
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
              Text(
                description,
                style: const TextStyle(
                    fontFamily: "Sora",
                    fontWeight: FontWeight.w100,
                    fontSize: 13),
              ),
            ],
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
