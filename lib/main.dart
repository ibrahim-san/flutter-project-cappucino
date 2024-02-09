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
      theme: ThemeData(
        primarySwatch: myBrownColor,
        useMaterial3: true,
      ),
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
                          const SizedBox(
                            width: 8,
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
              ),
              const DescriptionSection(
                  description:
                      "A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85 ml of fresh milk the fo"),
              const SizeSection(),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          height: 170,
          color: Colors.white,
          elevation: 0,
          shadowColor: Colors.black.withOpacity(0.2),
          child: CheckoutSection(
              price: "\$ 4.53",
              button: RoundedButton(
                  text: "Buy Now",
                  textColor: Colors.white,
                  buttonColor: myBrownColor,
                  fontSize: 21,
                  borderColor: myBrownColor,
                  height: 70)),
        ));
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
              const SizedBox(height: 8.0),
              Text(
                description,
                style: TextStyle(
                    fontFamily: "Sora",
                    color: Colors.black.withOpacity(0.25),
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: 28.0,
                  ),
                  Text(
                    "$rating",
                    style: const TextStyle(
                        fontFamily: "Sora",
                        fontSize: 19,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "($quantity)",
                    style: TextStyle(
                        fontFamily: "Sora",
                        fontSize: 16,
                        color: Colors.black.withOpacity(0.25),
                        fontWeight: FontWeight.bold),
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

class DescriptionSection extends StatelessWidget {
  const DescriptionSection({super.key, required this.description});

  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          width: 360,
          child: Text(
            "Description",
            style: TextStyle(
                fontFamily: "Sora", fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        const SizedBox(height: 10.0),
        SizedBox(
          width: 360,
          child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(children: [
                TextSpan(
                  text: "$description..",
                  style: TextStyle(
                      fontFamily: "Sora",
                      fontSize: 18,
                      color: Colors.black.withOpacity(0.25),
                      fontWeight: FontWeight.bold),
                ),
                TextSpan(
                    text: "Read More",
                    style: TextStyle(
                        fontFamily: "Sora",
                        fontSize: 18,
                        color: myBrownColor,
                        fontWeight: FontWeight.bold))
              ])),
        ),
        const SizedBox(height: 10.0),
      ],
    );
  }
}

class SizeSection extends StatelessWidget {
  const SizeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 360,
      height: 400,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          const Text(
            "Size",
            style: TextStyle(
                fontFamily: "Sora", fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Expanded(
                  child: RoundedButton(
                      height: 50.0,
                      fontSize: 15,
                      text: "S",
                      textColor: Colors.black,
                      buttonColor: Colors.white,
                      borderColor: Colors.grey)),
              Expanded(
                  child: RoundedButton(
                      height: 50.0,
                      fontSize: 15,
                      text: "M",
                      textColor: myBrownColor,
                      buttonColor: Colors.pink.shade50,
                      borderColor: myBrownColor)),
              const Expanded(
                  child: RoundedButton(
                      height: 50.0,
                      fontSize: 15,
                      text: "L",
                      textColor: Colors.black,
                      buttonColor: Colors.white,
                      borderColor: Colors.grey)),
            ],
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}

class RoundedButton extends StatelessWidget {
  const RoundedButton(
      {super.key,
      required this.text,
      required this.textColor,
      required this.buttonColor,
      required this.borderColor,
      required this.height,
      required this.fontSize});

  final String text;
  final Color textColor;
  final Color buttonColor;
  final Color borderColor;
  final double height;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      // ignore: sized_box_for_whitespace
      child: Container(
        height: height,
        child: OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            foregroundColor: textColor,
            side: BorderSide(color: borderColor),
            backgroundColor: buttonColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(11.0),
            ),
          ),
          child: Text(text,
              style: TextStyle(
                  color: textColor,
                  fontFamily: "Sora",
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}

class CheckoutSection extends StatelessWidget {
  const CheckoutSection({super.key, required this.price, required this.button});

  final String price;
  final Widget button;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 60),
      child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 40, left: 25, bottom: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Price",
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.25),
                        fontFamily: "Sora",
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    price,
                    style: TextStyle(
                        color: myBrownColor,
                        fontFamily: "Sora",
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  )
                ],
              ),
            ),
            Expanded(child: button),
          ],
      ),
    );
  }
}
