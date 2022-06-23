//BurgerJoint-Ordering-System main app
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import './OrderProgressPage.dart';
import './accordion_class.dart';
import 'login_page..dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      initialRoute: '/', //don't define home when using initialRoute
      routes: {
        '/': (context) => const MyHomePage(title: 'Home page'),
        '/Login': (context) => LoginPage(),
        '/OrderProgress': (context) =>
            const OrderProgressPage(title: 'Order Progress'),
      },
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
    Accordion(title: 'Table1', content: 'Burger', quantity: '3'),
    Accordion(title: 'Table2', content: 'Chicken chop', quantity: '1'),
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
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/Login',
                  arguments: accordions,
                );
              },
              child: const Text('Login'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/OrderProgress',
                    arguments: accordions,
                  );
                },
                child: const Text('Order Progress')),
          ],
        ),
      ),
    );
  }
}
