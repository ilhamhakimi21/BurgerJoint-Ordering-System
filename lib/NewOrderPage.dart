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

class _NewOrderPageState extends State<NewOrderPage> {
  @override
  Widget build(BuildContext context) {
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
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              filled: true,
                              fillColor: Colors.white),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                                onPressed: (() {
                                  Navigator.pushNamed(
                                    context,
                                    '/mainorder',
                                  );
                                }),
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
