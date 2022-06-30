import 'dart:convert';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import './size_config.dart';
import './OrderSummary.dart';
import 'package:flutter_svg/svg.dart';
import './ordersummary_card.dart';
import '/default_button.dart';
import '/OrderSummaryScreen.dart';
import './mainorder.dart';
import 'package:firebase_core/firebase_core.dart';
import '/NewOrderPage.dart';

class Gerak extends StatelessWidget {
  const Gerak({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/OrderSummary': (context) =>
            const OrderSummaryScreen(title: 'Order Summary'),
      },
    );
  }
}

class MainMenu extends StatefulWidget {
  final String title;
  const MainMenu({Key? key, required this.title}) : super(key: key);

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true,
          bottom: const TabBar(
            indicatorColor: Colors.black,
            // labelColor: Colors.white,
            tabs: [Tab(text: "Main"), Tab(text: "Side"), Tab(text: "Drink")],
          ),
        ),
        body: TabBarView(
          children: [
            MainScreen(),
            SideScreen(),
            DrinkScreen(),
          ],
        ),
        floatingActionButton: Container(
          height: 70,
          width: 70,
          child: FittedBox(
            child: FloatingActionButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/OrderSummary',
                  );
                },
                backgroundColor: Colors.black,
                child: Icon(
                  MdiIcons.food,
                  color: Colors.white,
                )),
          ),
        ),
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);
  final db = FirebaseDatabase.instance;
  @override
  Widget build(BuildContext context) {
    final summref = db.ref().child('order/${Num.ordernum}/food');

    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    Future<List<Widget>> createList() async {
      List<Widget> items = [];
      String dataString =
          await DefaultAssetBundle.of(context).loadString("assets/main.json");
      List<dynamic> dataJSON = jsonDecode(dataString);

      dataJSON.forEach((object) {
        items.add(Padding(
          padding: EdgeInsets.all(2.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 2.0,
                      blurRadius: 5.0),
                ]),
            margin: EdgeInsets.all(5.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0)),
                  child: Image.asset(
                    object["placeImage"],
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(object["placeName"]),
                        Text(
                          "Price: RM ${object["Bprice"].toStringAsFixed(2)}",
                          style:
                              TextStyle(fontSize: 12.0, color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: (() {
                    summref.child(Num.foodnum.toString()).set({
                      "Name": object["placeName"],
                      "Price": object["Bprice"],
                      "Quantity": "1",
                    }).asStream();
                    Num.foodnum++;
                  }),
                  child: const Icon(
                    Icons.add,
                    color: Colors.black,
                    size: 20,
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: HexColor("#FFD700"),
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(8.0),
                  ),
                )
              ],
            ),
          ),
        ));
      });

      return items;
    }

    return Container(
      height: screenHeight,
      width: screenWidth,
      child: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: FutureBuilder<Iterable>(
                  initialData: <Widget>[Text("")],
                  future: createList(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Padding(
                          padding: EdgeInsets.all(8.0),
                          child: ListView(
                            primary: false,
                            shrinkWrap: true,
                            children: List<Widget>.from(snapshot.data!),
                          ));
                    } else {
                      return CircularProgressIndicator();
                    }
                  }),
            )
          ],
        ),
      )),
    );
  }
}

class SideScreen extends StatelessWidget {
  SideScreen({Key? key}) : super(key: key);

  final db = FirebaseDatabase.instance;
  @override
  Widget build(BuildContext context) {
    final summref = db.ref().child('order/${Num.ordernum}/food');
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    Future<List<Widget>> createList() async {
      List<Widget> items = [];
      String dataString =
          await DefaultAssetBundle.of(context).loadString("assets/side.json");
      List<dynamic> dataJSON = jsonDecode(dataString);

      dataJSON.forEach((object) {
        items.add(Padding(
          padding: EdgeInsets.all(2.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 2.0,
                      blurRadius: 5.0),
                ]),
            margin: EdgeInsets.all(5.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0)),
                  child: Image.asset(
                    object["placeImage"],
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(object["placeName"]),
                        Text(
                          "Price: RM ${object["Bprice"].toStringAsFixed(2)}",
                          style:
                              TextStyle(fontSize: 12.0, color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: (() {
                    summref.child(Num.foodnum.toString()).set({
                      "Name": object["placeName"],
                      "Price": object["Bprice"],
                      "Quantity": "1",
                    }).asStream();
                    Num.foodnum++;
                  }),
                  child: const Icon(
                    Icons.add,
                    color: Colors.black,
                    size: 20,
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: HexColor("#FFD700"),
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(8.0),
                  ),
                )
              ],
            ),
          ),
        ));
      });

      return items;
    }

    return Container(
      height: screenHeight,
      width: screenWidth,
      child: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: FutureBuilder<Iterable>(
                  initialData: <Widget>[Text("")],
                  future: createList(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Padding(
                          padding: EdgeInsets.all(8.0),
                          child: ListView(
                            primary: false,
                            shrinkWrap: true,
                            children: List<Widget>.from(snapshot.data!),
                          ));
                    } else {
                      return CircularProgressIndicator();
                    }
                  }),
            )
          ],
        ),
      )),
    );
  }
}

class DrinkScreen extends StatelessWidget {
  DrinkScreen({Key? key}) : super(key: key);

  final db = FirebaseDatabase.instance;
  @override
  Widget build(BuildContext context) {
    final summref = db.ref().child('order/${Num.ordernum}/food');
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    Future<List<Widget>> createList() async {
      List<Widget> items = [];
      String dataString =
          await DefaultAssetBundle.of(context).loadString("assets/drink.json");
      List<dynamic> dataJSON = jsonDecode(dataString);

      dataJSON.forEach((object) {
        items.add(Padding(
          padding: EdgeInsets.all(2.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 2.0,
                      blurRadius: 5.0),
                ]),
            margin: EdgeInsets.all(5.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0)),
                  child: Image.asset(
                    object["placeImage"],
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(object["placeName"]),
                        Text(
                          "Price: RM ${object["Bprice"].toStringAsFixed(2)}",
                          style:
                              TextStyle(fontSize: 12.0, color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: (() {
                    summref.child(Num.foodnum.toString()).set({
                      "Name": object["placeName"],
                      "Price": object["Bprice"],
                      "Quantity": "1",
                    }).asStream();
                    Num.foodnum++;
                  }),
                  child: const Icon(
                    Icons.add,
                    color: Colors.black,
                    size: 20,
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: HexColor("#FFD700"),
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(8.0),
                  ),
                )
              ],
            ),
          ),
        ));
      });

      return items;
    }

    return Container(
      height: screenHeight,
      width: screenWidth,
      child: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: FutureBuilder<Iterable>(
                  initialData: <Widget>[Text("")],
                  future: createList(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Padding(
                          padding: EdgeInsets.all(8.0),
                          child: ListView(
                            primary: false,
                            shrinkWrap: true,
                            children: List<Widget>.from(snapshot.data!),
                          ));
                    } else {
                      return CircularProgressIndicator();
                    }
                  }),
            )
          ],
        ),
      )),
    );
  }
}
