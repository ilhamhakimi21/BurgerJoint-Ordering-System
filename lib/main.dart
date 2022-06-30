//BurgerJoint-Ordering-System main app
import 'package:burger_order/authpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import './mainorder.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'firebase_options.dart';
import './OrderProgressPage.dart';
import './accordion_class.dart';
import './login_page..dart';
import './signup_page.dart';
import '/NewOrderPage.dart'; //m
import '/OrderSummaryScreen.dart'; //m
import './authentication_service.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
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
        primarySwatch: Colors.brown,
      ),
      initialRoute: '/', //don't define home when using initialRoute
      routes: {
        '/': (context) => const MyHomePage(title: 'BurgerJoint'),
        '/Login': (context) => const LoginPage(title: "Login Page"),
        '/Signup': (context) => const SignupPage(title: 'Signup Page'),
        '/OrderProgress': (context) =>
            const OrderProgressPage(title: 'Order Progress'),
        '/NewOrder': (context) => const NewOrderPage(title: 'New Order'),
        '/OrderSummary': (context) => //m
            const OrderSummaryScreen(title: 'Order Summary'),
        '/mainorder': (context) => const MainMenu(title: 'New Order'),
        '/authPage': (context) => authPage(),
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
    final user = FirebaseAuth.instance.currentUser;
    final String mail = user?.email ?? "Not signed in.";
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/burger_bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // StreamBuilder<User?>(
              //     stream: FirebaseAuth.instance.authStateChanges(),
              //     builder: (context, snapshot) {
              //       if (snapshot.hasData) {
              //         return Text(
              //           user.email!,
              //           style: TextStyle(
              //               fontSize: 20, fontWeight: FontWeight.bold),
              //         );
              //       } else {
              //         return Text('-');
              //       }
              //     }),
              Text('Sign in as', style: TextStyle(fontSize: 20)),
              const SizedBox(height: 8),
              Text(mail,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/authPage',
                    arguments: accordions,
                  );
                },
                child: const Text('Login'),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/NewOrder',
                    );
                  },
                  child: const Text('New Order')),
              const SizedBox(height: 30),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/OrderProgress',
                      arguments: accordions,
                    );
                  },
                  child: const Text('Order Progress')),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  context.read<AuthenticationService>().signOut();
                },
                child: Text("Sign out"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
