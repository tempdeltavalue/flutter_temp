import 'package:flutter/material.dart';

class Product {
  final String imageUrl;
  int count;

  Product({required this.imageUrl, this.count = 0});
}

class TableScreen extends StatefulWidget {
  @override
  _TableScreenState createState() => _TableScreenState();
}

class _TableScreenState extends State<TableScreen> {
  List<Product> products = [
    Product(imageUrl: 'assets/hlib.png'),
    Product(imageUrl: 'assets/sandwich.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Кошичок'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          dataRowHeight: 120, // Adjust the height as needed
          columns: [
            DataColumn(label: Text('Штуки')),
          ],
          rows: products.map(
                (product) => DataRow(
              cells: [
                DataCell(
                  Container(
                    width: MediaQuery.of(context).size.width - 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          product.imageUrl,
                          width: 80,
                          height: 80,
                        ),
                        SizedBox(width: 8),
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.remove),
                              onPressed: () {
                                setState(() {
                                  if (product.count > 0) {
                                    product.count--;
                                  }
                                });
                              },
                            ),
                            Text(
                              '${product.count}',
                              style: TextStyle(fontSize: 18),
                            ),
                            IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () {
                                setState(() {
                                  product.count++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ).toList(),
        ),
      ),


      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            // Add logic for the "Купить" button
            print('Купить button pressed!');
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Купить', style: TextStyle(fontSize: 18, color: Colors.white)),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: TableScreen(),
  ));
}
