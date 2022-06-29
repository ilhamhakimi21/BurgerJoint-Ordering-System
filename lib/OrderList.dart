// main.dart
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // Remove the debug banner
        debugShowCheckedModeBanner: false,
        title: 'Order List',
        theme: ThemeData(
          primarySwatch: Colors.brown,
        ),
        home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  // Generate some dummy data
  final List<Map<String, dynamic>> _items = List.generate(
      10,
      (index) =>
          {"id": index, "title": "Item $index", "subtitle": "Subtitle $index"});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Order List'),
          leading: Icon(Icons.view_list),
        ),
        body: ListView(
            children: ListTile.divideTiles(
                color: Colors.grey,
                tiles: _items.map((item) => ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.grey,
                      ),
                      title: Text(item['title']),
                      subtitle: Text(item['subtitle']),
                      onTap: () {},
                    ))).toList()));
  }
}
