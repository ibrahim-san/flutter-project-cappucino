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
                child: Image.asset(
                  "images/Rectangle 1706.jpg",
                  scale: 0.87,
                ),
              ),
            ),
            Row(
              children: [
                const Expanded(
                  child: MenuItem(
                    description: "with Chocolate",
                    foodItem: "Cappucino",
                    rating: 4.8,
                    quantity: 230,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50, left: 100),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 245, 241, 241),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              'images/bean.jpg',
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 245, 241, 241),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              'images/milk.jpg',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 350,
              child: Divider(
                    color: Colors.black.withOpacity(0.25), // Semi-opaque line
                    thickness: 1, // Thin line
                    height: 60, // Space above and below the divider
                  ),
            )
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
          padding: const EdgeInsets.only(right: 95.0),
          child: Image.asset(firstImage),
        ),
        Text(
          title,
          style: const TextStyle(
              fontFamily: "Sora", fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 95.0),
          child: Image.asset(secondImage),
        )
      ],
    );
  }
}

class MenuItem extends StatelessWidget {
  const MenuItem(
      {super.key,
      required this.description,
      required this.foodItem,
      required this.quantity,
      required this.rating});

  final String foodItem;
  final String description;
  final double rating;
  final int quantity;

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
              const SizedBox(height: 10.0),
              Text(
                description,
                style: TextStyle(
                    fontFamily: "Sora",
                    color: Colors.black.withOpacity(0.5),
                    fontSize: 13),
              ),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: 24.0,
                  ),
                  Text(
                    "$rating",
                    style: const TextStyle(
                        fontFamily: "Sora",
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "($quantity)",
                    style: TextStyle(
                        fontFamily: "Sora",
                        fontSize: 12,
                        color: Colors.black.withOpacity(0.5)),
                  )
                ],
              )
            ],
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
