// main.dart
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import './mainorder.dart';
import './main.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'Order List',
//         theme: ThemeData(
//           primarySwatch: Colors.brown,
//         ),
//         home: HomePage());
//   }
// }

class Gerk extends StatelessWidget {
  const Gerk({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/OrderList': (context) => OrderList(title: 'Order List'),
      },
    );
  }
}

class OrderList extends StatelessWidget {
  final String title;
  OrderList({Key? key, required this.title}) : super(key: key);
  // Generate some dummy data
  final List<Map<String, dynamic>> _items = List.generate(
      10,
      (index) =>
          {"id": index, "title": "Item $index", "subtitle": "Subtitle $index"});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
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
                      isThreeLine: true,
                      onTap: () {
                        //Navigator.pushNamed(
                        //context,
                        //'/OrderProgress',
                        //);
                      },
                    ))).toList()));
  }
}
