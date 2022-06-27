import 'package:flutter/material.dart';
import './size_config.dart';
import './OrderSummary.dart';
import 'package:flutter_svg/svg.dart';
import './ordersummary_card.dart';
import '/default_button.dart';
// import '/constants.dart';

class OrderSummaryScreen extends StatefulWidget {
  final String title;
  const OrderSummaryScreen({Key? key, required this.title}) : super(key: key);

  @override
  State<OrderSummaryScreen> createState() => _OrderSummaryScreenState();
}

class _OrderSummaryScreenState extends State<OrderSummaryScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      // bottomNavigationBar: SubmitOrder(),
    );
  }
}

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    title: Column(
      children: [
        Text(
          "Order Summary",
          style: TextStyle(color: Colors.black),
        ),
      ],
    ),
  );
}

class Body extends StatefulWidget {
// Body({
//     Key? key,
//     required this.ordersummary,
//   }) : super(key: key);

  double totalprice = 0;
  // final OrderSummary ordersummary;

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<OrderSummary> os = demoOrderSummary;

  void calcTotal(List<OrderSummary> ordersummary) {
    double tp = 0;

    for (OrderSummary oslist in ordersummary) {
      tp += oslist.product.m_price * oslist.product.m_quantity;
    }

    setState(() {
      widget.totalprice = tp;
    });
  }

  @override
  Widget build(BuildContext context) {
    calcTotal(os);
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Column(
        children: [
          //mainaxisaligment
          // Column(
          //   children: [
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => Divider(
                thickness: 1.5,
                color: Colors.black,
              ),
              itemCount: demoOrderSummary.length,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Dismissible(
                  key: Key(demoOrderSummary[index].product.m_name),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    setState(() {
                      demoOrderSummary.removeAt(index);
                    });
                  },
                  background: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Color(0xFFFFE6E6),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Spacer(),
                        SvgPicture.asset("images/Trash.svg"),
                      ],
                    ),
                  ),
                  child:
                      // OrderSummaryCard(ordersummary: demoOrderSummary[index]),
                      Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SizedBox(
                        width: 150,
                        child: Container(
                          padding: EdgeInsets.only(right: 40),
                          child: RichText(
                            text: TextSpan(
                              style: DefaultTextStyle.of(context).style,
                              text: demoOrderSummary[index].product.m_name,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 90,
                        child: Container(
                          padding: EdgeInsets.only(right: 30),
                          child: RichText(
                            text: TextSpan(
                                style: DefaultTextStyle.of(context).style,
                                children: <TextSpan>[
                                  TextSpan(text: 'RM'),
                                  TextSpan(
                                      text:
                                          ' ${demoOrderSummary[index].product.m_price}'),
                                ]),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 125,
                        // height: 80,
                        child: Column(
                          children: [
                            Container(
                              // padding: EdgeInsets.only(left: 5),
                              child: Row(
                                children: <Widget>[
                                  IconButton(
                                    padding: new EdgeInsets.all(0.0),
                                    icon: const Icon(Icons.remove_circle),
                                    iconSize: 20,
                                    onPressed: () {
                                      setState(() {
                                        if (demoOrderSummary[index]
                                                .product
                                                .m_quantity >
                                            1) {
                                          demoOrderSummary[index]
                                              .product
                                              .m_quantity--;
                                          calcTotal(os);
                                        } else {
                                          showAlertDialog(context);
                                        }
                                        // if(widget.ordersummary.product.m_quantity==0){
                                        //   demoOrderSummary.removeAt();}
                                        //if user want to remove they have to slide left(dismissible)
                                      });
                                    },
                                  ),
                                  Text(
                                    "${demoOrderSummary[index].product.m_quantity}",
                                    // style: TextStyle(fontSize: 8),
                                  ),
                                  new IconButton(
                                    icon: const Icon(Icons.add_circle),
                                    padding: new EdgeInsets.all(0.0),
                                    iconSize: 20,
                                    onPressed: () {
                                      setState(() {
                                        demoOrderSummary[index]
                                            .product
                                            .m_quantity++;
                                        calcTotal(os);
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                            // Text('${widget.totalprice}'), //testing purpose
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: getProportionateScreenWidth(15),
              horizontal: getProportionateScreenWidth(30),
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
                  SizedBox(height: getProportionateScreenHeight(20)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(
                        TextSpan(
                          text: "Total:\n",
                          style: TextStyle(fontSize: 18, color: Colors.black),
                          children: [
                            TextSpan(
                              text: "RM ${widget.totalprice}",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: getProportionateScreenWidth(130),
                        child: DefaultButton(
                          text: "Submit",
                          press: () {},
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
