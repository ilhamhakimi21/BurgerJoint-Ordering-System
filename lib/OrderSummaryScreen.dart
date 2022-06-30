import 'package:flutter/material.dart';
import './size_config.dart';
import './OrderSummary.dart';
import 'package:flutter_svg/svg.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import './ordersummary_card.dart';
import '/default_button.dart';
import 'NewOrderPage.dart';
import 'dart:async';
import 'mainorder.dart';
import '/constants.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'dart:convert';

class Grk extends StatelessWidget {
  const Grk({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      initialRoute: '/',
    );
  }
}

class OrderSummaryScreen extends StatefulWidget {
  final String title;
  const OrderSummaryScreen({Key? key, required this.title}) : super(key: key);

  @override
  State<OrderSummaryScreen> createState() => _OrderSummaryScreenState();
}

class _OrderSummaryScreenState extends State<OrderSummaryScreen> {
  @override
  Widget build(BuildContext context) {
    // SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Body(),
      // bottomNavigationBar: SubmitOrder(),
    );
  }
}

class Body extends StatefulWidget {
// Body({
//     Key? key,
//     required this.ordersummary,
//   }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  // List<OrderSummary> os = demoOrderSummary;
  // final db = FirebaseDatabase.instance.ref();
  final fb = FirebaseDatabase.instance;
  TextEditingController second = TextEditingController();
  TextEditingController third = TextEditingController();
  TextEditingController fourth = TextEditingController();

  var l;
  var g;
  var k;
  double tp = 0;

  // void calctotal() {
  //   double totalp = 0;
  //   for (int i = 0; i < l.length; i++) {
  //     totalp = l[1][i] * l[i][0];
  //     setState(() {
  //       tp = totalp;
  //     });
  //   }
  // }

  // void calctotal() {
  //   double totalp = 0;
  //   var reg = RegExp('[a-zA-Z: ]');
  //   var p = l[0].toString().replaceAll(reg, '');
  //   var qty = l[1].toString().replaceAll(reg, '');

  //   totalp += double.parse(p) * int.parse(qty).toDouble();
  //   setState(() {
  //     tp = totalp;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // calctotal();
    final ref = fb.ref().child('order/${Num.ordernum}/food');
    double totalp = 0;

    // calcTotal(os);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: (20)),
      child: Column(
        children: [
          FirebaseAnimatedList(
            query: ref,
            shrinkWrap: true,
            itemBuilder: (context, snapshot, animation, index) {
              var v = snapshot.value
                  .toString(); // {subtitle: webfun, title: subscribe}

              g = v.replaceAll(
                  RegExp(
                      "{|}| Items.fromRTDB(element.key, Map<String, dynamic>.from(element.value));|  Name:|  Price:|  Quantity: | Status:"),
                  ""); // webfun, subscribe
              g.trim();
              var reg = RegExp('[a-zA-Z: ]');

              l = g.split(','); // [webfun,  subscribe}]

              // print(l[0].toString().replaceAll(reg, ''));
              var p = l[0].toString().replaceAll(reg, '');
              var qty = l[1].toString().replaceAll(reg, '');
              print("Price is: $p");
              print("Qty is: $qty");
              totalp += double.parse(p) * int.parse(qty).toDouble();
              print("Total price is now: $totalp");
              // calctotal();

              return GestureDetector(
                onTap: () {
                  setState(() {
                    k = snapshot.key;
                  });

                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: Container(
                        decoration: BoxDecoration(border: Border.all()),
                        child: TextField(
                          controller: fourth,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            hintText: 'Quantity',
                          ),
                        ),
                      ),
                      // content: Column(
                      //   children: [
                      //     // Container(
                      //     //   decoration: BoxDecoration(border: Border.all()),
                      //     //   child: TextField(
                      //     //     enabled: false,
                      //     //     controller: third,
                      //     //     textAlign: TextAlign.center,
                      //     //     decoration: InputDecoration(
                      //     //       hintText: 'Price',
                      //     //       fillColor: Colors.grey,
                      //     //       filled: true,
                      //     //     ),
                      //     //   ),
                      //     // ),
                      //     Container(
                      //       decoration: BoxDecoration(border: Border.all()),
                      //       child: TextField(
                      //         controller: fourth,
                      //         textAlign: TextAlign.center,
                      //         decoration: InputDecoration(
                      //           hintText: 'Quantity',
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      actions: <Widget>[
                        MaterialButton(
                          onPressed: () {
                            Navigator.of(ctx).pop();
                          },
                          color: Color.fromARGB(255, 0, 22, 145),
                          child: Text(
                            "Cancel",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        MaterialButton(
                          onPressed: () async {
                            await upd();
                            // calctotal();
                            Navigator.of(ctx).pop();
                          },
                          color: Color.fromARGB(255, 0, 22, 145),
                          child: Text(
                            "Update",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      tileColor: Colors.indigo[100],
                      trailing: IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Color.fromARGB(255, 255, 0, 0),
                        ),
                        onPressed: () {
                          ref.child(snapshot.key!).remove();
                        },
                      ),
                      title: Column(
                        children: [
                          Text(
                            l[2],
                            // 'dd',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            l[1],
                            // 'dd',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      subtitle: Column(
                        children: [
                          Text(
                            l[0],
                            // 'dd',

                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          //mainaxisaligment
          // Column(
          //   children: [
          // Expanded(
          //   child: ListView.separated(
          //     separatorBuilder: (context, index) => Divider(
          //       thickness: 1.5,
          //       color: Colors.black,
          //     ),
          //     itemCount: demoOrderSummary.length,
          //     itemBuilder: (context, index) => Padding(
          //       padding: EdgeInsets.symmetric(vertical: 10),
          //       child: Dismissible(
          //         key: Key(demoOrderSummary[index].product.m_name),
          //         direction: DismissDirection.endToStart,
          //         onDismissed: (direction) {
          //           setState(() {
          //             demoOrderSummary.removeAt(index);
          //           });
          //         },
          //         background: Container(
          //           padding: EdgeInsets.symmetric(horizontal: 20),
          //           decoration: BoxDecoration(
          //             color: Color(0xFFFFE6E6),
          //             borderRadius: BorderRadius.circular(15),
          //           ),
          //           child: Row(
          //             children: [
          //               Spacer(),
          //               SvgPicture.asset("images/Trash.svg"),
          //             ],
          //           ),
          //         ),
          //         child:
          //             // OrderSummaryCard(ordersummary: demoOrderSummary[index]),
          //             Row(
          //           // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //           children: <Widget>[
          //             SizedBox(
          //               width: 150,
          //               child: Container(
          //                 padding: EdgeInsets.only(right: 40),
          //                 child: RichText(
          //                   text: TextSpan(
          //                     style: DefaultTextStyle.of(context).style,
          //                     text: demoOrderSummary[index].product.m_name,
          //                   ),
          //                 ),
          //               ),
          //             ),
          //             SizedBox(
          //               width: 90,
          //               child: Container(
          //                 padding: EdgeInsets.only(right: 30),
          //                 child: RichText(
          //                   text: TextSpan(
          //                       style: DefaultTextStyle.of(context).style,
          //                       children: <TextSpan>[
          //                         TextSpan(text: 'RM'),
          //                         TextSpan(
          //                             text:
          //                                 ' ${demoOrderSummary[index].product.m_price}'),
          //                       ]),
          //                 ),
          //               ),
          //             ),
          //             SizedBox(
          //               width: 125,
          //               // height: 80,
          //               child: Column(
          //                 children: [
          //                   Container(
          //                     // padding: EdgeInsets.only(left: 5),
          //                     child: Row(
          //                       children: <Widget>[
          //                         IconButton(
          //                           padding: new EdgeInsets.all(0.0),
          //                           icon: const Icon(Icons.remove_circle),
          //                           iconSize: 20,
          //                           onPressed: () {
          //                             setState(() {
          //                               if (demoOrderSummary[index]
          //                                       .product
          //                                       .m_quantity >
          //                                   1) {
          //                                 demoOrderSummary[index]
          //                                     .product
          //                                     .m_quantity--;
          //                                 calcTotal(os);
          //                               } else {
          //                                 showAlertDialog(context);
          //                               }
          //                               // if(widget.ordersummary.product.m_quantity==0){
          //                               //   demoOrderSummary.removeAt();}
          //                               //if user want to remove they have to slide left(dismissible)
          //                             });
          //                           },
          //                         ),
          //                         Text(
          //                           "${demoOrderSummary[index].product.m_quantity}",
          //                           // style: TextStyle(fontSize: 8),
          //                         ),
          //                         new IconButton(
          //                           icon: const Icon(Icons.add_circle),
          //                           padding: new EdgeInsets.all(0.0),
          //                           iconSize: 20,
          //                           onPressed: () {
          //                             setState(() {
          //                               demoOrderSummary[index]
          //                                   .product
          //                                   .m_quantity++;
          //                               calcTotal(os);
          //                             });
          //                           },
          //                         ),
          //                       ],
          //                     ),
          //                   ),
          //                   // Text('${widget.totalprice}'), //testing purpose
          //                 ],
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          // StreamBuilder(
          //   stream:
          //       db.child('order/1/food/${fnum.foodnum}').orderByKey().onValue,
          //   builder: (context, AsyncSnapshot snap) {
          //     // return ListView(
          //     //   children: snapshot.data!.docs.map,
          //     // )
          //     final tileList = <ListTile>[];
          //     if (snap.hasData &&
          //         !snap.hasError &&
          //         snap.data.snapshot.value != null) {
          //       final eachFood = Map<String, dynamic>.from(
          //           (snap.data! as DatabaseEvent).snapshot.value);
          //       eachFood.forEach((key, value) {
          //         final nextFood = Map<String, dynamic>.from(value);
          //         final foodTile = ListTile(
          //             leading: Text(nextFood['fname']),
          //             title: Text(nextFood['price']),
          //             trailing: Text(nextFood['qty']));
          //         tileList.add(foodTile);
          //       });
          //     }
          //     return Expanded(
          //       child: ListView(
          //         children: tileList,
          //       ),
          //     );
          //   },
          // ),
          // Text(_displ),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: (15),
              horizontal: (30),
            ),
            // height: 174,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, -15),
                  blurRadius: 20,
                  color: Color(0xFFDADADA).withOpacity(0.40),
                )
              ],
            ),
            child: SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: (20)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(
                        TextSpan(
                          text: "Total:\n",
                          style: TextStyle(fontSize: 18, color: Colors.black),
                          children: [
                            TextSpan(
                              text: "RM ${tp}",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: (130),
                        child: ElevatedButton(
                          child: Text("Submit"),
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              '/',
                            );
                            Num.foodnum = 1;
                            fb.ref("order/${Num.ordernum}").update({
                              "TotalPrice": totalp,
                            }).asStream();
                            Num.ordernum++;
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  upd() async {
    DatabaseReference ref1 =
        FirebaseDatabase.instance.ref("order/${Num.ordernum}/food/$k");

// Only update the name, leave the age and address!
    await ref1.update({
      // "food": second.text,
      // "price": third.text,
      "Quantity": fourth.text,
    });
    // second.clear();
    // third.clear();
    fourth.clear();
  }
}

showAlertDialog(BuildContext context) {
  // Create button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(""),
    content: Text("Slide left to remove the order."),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
