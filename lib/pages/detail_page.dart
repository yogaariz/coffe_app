import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final Map coffee;

  DetailPage({required this.coffee});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(coffee["name"])),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Icon(Icons.local_cafe, size: 120),
            SizedBox(height: 20),
            Text(coffee["name"], style: TextStyle(fontSize: 24)),
            Text("\$${coffee["price"]}"),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Text("Buy Now"),
            )
          ],
        ),
      ),
    );
  }
}