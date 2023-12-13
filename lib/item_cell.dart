import 'package:flutter/material.dart';
import 'qr_code_screen.dart';

class ProductItem {
  final String imageUrl;
  final String name;
  final String subtitle;

  ProductItem({
    required this.imageUrl,
    required this.name,
    required this.subtitle,
  });
}

class ProductItemCell extends StatelessWidget {
  final ProductItem item;
  final Function(int) onPressedCallback;

  ProductItemCell({
    required this.item,
    required this.onPressedCallback,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigate to the next screen with QR code
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QrCodeScreen(),
          ),
        );
      },
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(item.imageUrl),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 10),
                Text(
                  item.subtitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 8.0,
            right: 8.0,
            child: RoundedButton(
              onPressedCallback: onPressedCallback,
            ),
          ),
        ],
      ),
    );
  }
}

class RoundedButton extends StatelessWidget {
  final Function(int) onPressedCallback;

  RoundedButton({
    required this.onPressedCallback,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: TextButton(
        onPressed: () {
          // Call the callback with the index
          onPressedCallback(0); // Replace 0 with the actual index
        },
        child: Text(
          "Купить",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}