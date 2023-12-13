
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'item_cell.dart';
import 'shopping_cart.dart';
import 'dart:math';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ConfettiController _controllerCenter = ConfettiController(duration: const Duration(seconds: 3));

  List<ProductItem> items = [
    ProductItem(
      imageUrl: 'assets/hlib.png',
      name: 'Хлібчик',
      subtitle: 'Subtitle 2',
    ),
    ProductItem(
      imageUrl: 'assets/sandwich.png',
      name: 'Сандвіч',
      subtitle: 'Subtitle 1',
    ),
    ProductItem(
      imageUrl: 'assets/cake.png',
      name: 'Піроженко',
      subtitle: 'Subtitle 1',
    ),
    // Add more items as needed
  ];

  @override
  void dispose() {
    _controllerCenter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Меню'),
        actions: [
          IconButton(
            onPressed: () {
              // Add your logic for the cart button press
              // For example, navigate to the cart screen
               Navigator.push(
                 context,
                 MaterialPageRoute(
                   builder: (context) => TableScreen(), // Replace with your cart screen
                 ),
               );
            },
            icon: Row(
              children: [
                Icon(Icons.shopping_cart), // Replace with your configurable icon
                SizedBox(width: 4), // Adjust the spacing between icon and text
                Text('Кошик'), // Replace with your configurable text
              ],
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                buildVerticalLayout(context, items),
              ],
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 2, // Adjust as needed
            left: MediaQuery.of(context).size.width / 2, // Adjust as needed
            child: Align(
              alignment: Alignment.center,
              child: ConfettiWidget(
                confettiController: _controllerCenter,
                blastDirectionality: BlastDirectionality.explosive,
                shouldLoop: false,
                colors: const [
                  Colors.green,
                  Colors.blue,
                  Colors.pink,
                  Colors.orange,
                  Colors.purple
                ],
                createParticlePath: drawStar,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildVerticalLayout(BuildContext context, List<ProductItem> items) {
    return Column(
      children: items.map((item) => ProductItemCell(item: item,
        onPressedCallback: (int index) {
        // Do something with the index, such as writing to SharedPreferences
          _controllerCenter.play();
        print('Button pressed for item at index: $index');
      },)).toList(),
    );
  }


  Path drawStar(Size size) {
    // Method to convert degree to radians
    double degToRad(double deg) => deg * (pi / 180.0);

    const numberOfPoints = 5;
    final halfWidth = size.width / 2;
    final externalRadius = halfWidth;
    final internalRadius = halfWidth / 2.5;
    final degreesPerStep = degToRad(360 / numberOfPoints);
    final halfDegreesPerStep = degreesPerStep / 2;
    final path = Path();
    final fullAngle = degToRad(360);
    path.moveTo(size.width, halfWidth);

    for (double step = 0; step < fullAngle; step += degreesPerStep) {
      path.lineTo(halfWidth + externalRadius * cos(step),
          halfWidth + externalRadius * sin(step));
      path.lineTo(halfWidth + internalRadius * cos(step + halfDegreesPerStep),
          halfWidth + internalRadius * sin(step + halfDegreesPerStep));
    }
    path.close();
    return path;
  }

}
