import './accordion_class.dart';
import 'package:flutter/material.dart';

class AccordionCard extends StatefulWidget {
  final Accordion accordion;
  final VoidCallback? delete;

  const AccordionCard({Key? key, required this.accordion, required this.delete})
      : super(key: key);

  @override
  _AccordionCardState createState() => _AccordionCardState();
}

class _AccordionCardState extends State<AccordionCard> {
  bool _showContent = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(children: [
        ListTile(
          title: Text(widget.accordion.title),
          trailing: IconButton(
            icon: Icon(
                _showContent ? Icons.arrow_drop_up : Icons.arrow_drop_down),
            onPressed: () {
              setState(() {
                _showContent = !_showContent;
              });
            },
          ),
        ),
        _showContent
            ? Container(
          padding:
          const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(widget.accordion.content),
              Text("Qty: " + widget.accordion.quantity),
              ElevatedButton(
                  onPressed: widget.delete,
                  style: ElevatedButton.styleFrom(primary: Colors.green),
                  child: const Text("Complete")
              ),
            ],
          ),
        )
            : Container()
      ]),
    );
  }
}