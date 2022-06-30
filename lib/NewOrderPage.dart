import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '/OrderSummaryScreen.dart';
import './mainorder.dart';

class Tst extends StatelessWidget {
  const Tst({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const NewOrderPage(title: 'New Order'),
        '/OrderSummary': (context) =>
            const OrderSummaryScreen(title: 'Order Summary'),
        '/mainorder': (context) => const MainMenu(title: 'New Order'),
      },
    );
  }
}

class NewOrderPage extends StatefulWidget {
  final String title;
  const NewOrderPage({Key? key, required this.title}) : super(key: key);

  @override
  State<NewOrderPage> createState() => _NewOrderPageState();
}

class Num {
  static var ordernum = 1;
  static var foodnum = 1;
}

class _NewOrderPageState extends State<NewOrderPage> {
  TextEditingController table = TextEditingController();
  bool submit = false;
  final db = FirebaseDatabase.instance;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    table.addListener(() {
      setState(() {
        submit = table.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    table.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var num = 1;
    final summref = db.ref().child('order/${Num.ordernum}');
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey,
                ),
                width: 350,
                height: 200,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Table No.",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        TextField(
                          controller: table,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              filled: true,
                              fillColor: Colors.white),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                                onPressed: submit
                                    ? () {
                                        Navigator.pushNamed(
                                          context,
                                          '/mainorder',
                                        );
                                        summref.set({
                                          "table": table.text,
                                          "TotalPrice": "",
                                          "ProgressStatus": "0",
                                        }).asStream();
                                      }
                                    : null,
                                child: const Text("Submit")),
                          ],
                        ),
                      ]),
                )),
          ],
        ),
      ),
    );
  }
}
