import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(255, 250, 228, 227),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildVerticalLayout(context),
          ],
        ),
      ),
    );
  }

  Widget buildVerticalLayout(BuildContext context) {
    return Column(
      children: [
        buildDataRow(
          context,
          'https://shoco.ua/wp-content/uploads/2022/05/sajt-hlib.png',
          'Хлібчик',
          'Subtitle 2',
        ),
        buildDataRow(
          context,
          'https://smachno.ua/wp-content/uploads/2018/06/26/beze-s-malinoj.jpg',
          'Пірожене',
          'Subtitle 1',
        ),

        buildDataRow(
          context,
          'https://i.pinimg.com/736x/7f/93/ba/7f93baef9a379f441afb942a71e3c5cf.jpg',
          'Секретик',
          'Subtitle 1',
        ),
        // Add more rows as needed
      ],
    );
  }

  Widget buildDataRow(BuildContext context, String imageUrl, String name, String subtitle) {
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
      child: Container(
        margin: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: 200, // Adjust the width as needed
              height: 200, // Make the image square
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(imageUrl), // Use the provided image URL
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              name,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}

class QrCodeScreen extends StatefulWidget {
  const QrCodeScreen({Key? key}) : super(key: key);

  @override
  _QrCodeScreenState createState() => _QrCodeScreenState();
}

class _QrCodeScreenState extends State<QrCodeScreen> {
  String qrText = 'https://www.instagram.com/holycoffee_mlyniv/';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('QR Code')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              onChanged: (val) {
                setState(() {
                  qrText = val;
                });
              },
              decoration: InputDecoration(labelText: 'Type your text'),
            ),
            QrImageView(data: qrText, embeddedImage: AssetImage('assets/holy_coffee_logo.png'),),
          ],
        ),
      ),
    );
  }
}