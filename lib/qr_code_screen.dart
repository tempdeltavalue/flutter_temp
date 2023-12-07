import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCodeScreen extends StatefulWidget {

  QrCodeScreen({Key? key}) : super(key: key);

  @override
  _QrCodeScreenState createState() => _QrCodeScreenState();
}

class _QrCodeScreenState extends State<QrCodeScreen> {
  String qrText = 'https://www.instagram.com/holycoffee_mlyniv/';

  List<Comment> comments = [
    Comment(imageUrl: 'https://example.com/user1.jpg', text: 'То є дуже смачно!'),
    Comment(imageUrl: 'https://example.com/user2.jpg', text: 'Фіі шо це було'),
    // Add more hardcoded comments as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('QR Code')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            QrImageView(data: qrText, embeddedImage: AssetImage("assets/holy_coffee_logo.png"),),
            SizedBox(height: 20),
            buildCommentRows(),
          ],
        ),
      ),
    );
  }

  Widget buildCommentRows() {
    return Column(
      children: comments.map((comment) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(comment.imageUrl),
              radius: 20,
            ),
            SizedBox(width: 10),
            Text(comment.text),
          ],
        );
      }).toList(),
    );
  }
}

class Comment {
  final String imageUrl; // URL for the round image
  final String text;

  Comment({required this.imageUrl, required this.text});
}