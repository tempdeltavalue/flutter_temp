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
      // title: 'Holy coffee',
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(255, 250, 228, 227), // Set the background color to pink
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

  String qr_text = 'https://www.instagram.com/holycoffee_mlyniv/';

  //const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text('Holy coffee'),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          TextField(
            onChanged: (val) => setState(()=> qr_text = val),
            decoration: InputDecoration(labelText: 'Type your data'),),
          QrImageView(data: qr_text, embeddedImage: AssetImage('assets/holy_coffee_logo.png'),)
    ],
      ),
    )
    );
  }
}