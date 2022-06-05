//BurgerJoint-Ordering-System main app
import 'package:flutter/material.dart';
import './accordion_card.dart';
import './accordion_class.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Order Progress page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Accordion> accordions = [
    Accordion(title: 'Table1', content: 'Burger', quantity: '3')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: accordions.map((accordion) => AccordionCard(
                  accordion: accordion,
                  delete: () {
                    setState(() {
                      accordions.remove(accordion);
                    });
                  }
              )).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
