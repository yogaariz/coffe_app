import 'package:flutter/material.dart';
import 'detail_page.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, dynamic>> coffees = [
    {"name": "Cappuccino", "price": 4.53},
    {"name": "Latte", "price": 3.90},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Coffee Menu")),
      body: ListView.builder(
        itemCount: coffees.length,
        itemBuilder: (context, index) {
          var coffee = coffees[index];
          return ListTile(
            title: Text(coffee["name"]),
            subtitle: Text("\$${coffee["price"]}"),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => DetailPage(coffee: coffee),
                ),
              );
            },
          );
        },
      ),
    );
  }
}