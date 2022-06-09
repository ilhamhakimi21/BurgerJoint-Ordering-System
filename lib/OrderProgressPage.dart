import 'package:flutter/material.dart';
import './accordion_class.dart';
import './accordion_card.dart';

class OrderProgressPage extends StatefulWidget {
  final String title;
  const OrderProgressPage({Key? key, required this.title}) : super(key: key);

  @override
  State<OrderProgressPage> createState() => _OrderProgressPageState();
}

class _OrderProgressPageState extends State<OrderProgressPage> {

  // List<Accordion> accordions = [
  //   Accordion(title: 'Table1', content: 'Burger', quantity: '3')
  // ];

  @override
  Widget build(BuildContext context) {
    List<Accordion> accordions = ModalRoute.of(context)!.settings.arguments as
    List<Accordion>;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: accordions.map((accordion) => AccordionCard(
              accordion: accordion,
              delete: () {
                setState(() {
                  accordions.remove(accordion);
                });
              }
          )).toList(),
        ),
      ),
    );
  }
}
