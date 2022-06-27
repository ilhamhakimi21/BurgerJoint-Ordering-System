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
      bottomNavigationBar: SubmitOrder(),
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
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: ListView.builder(
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
                  SvgPicture.asset("assets/images/Trash.svg"),
                ],
              ),
            ),
            child: OrderSummaryCard(ordersummary: demoOrderSummary[index]),
          ),
        ),
      ),
    );
  }
}

class SubmitOrder extends StatelessWidget {
  const SubmitOrder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
            // Row(
            //   children: [
            //     Container(
            //       padding: EdgeInsets.all(10),
            //       height: getProportionateScreenWidth(40),
            //       width: getProportionateScreenWidth(40),
            //       decoration: BoxDecoration(
            //         color: Color(0xFFF5F6F9),
            //         borderRadius: BorderRadius.circular(10),
            //       ),
            //       child: SvgPicture.asset("assets/images/receipt.svg"),
            //     ),
            //     Spacer(),
            //     Text("Add voucher code"),
            //     const SizedBox(width: 10),
            //     Icon(
            //       Icons.arrow_forward_ios,
            //       size: 12,
            //       color: kTextColor,
            //     )
            //   ],
            // ),
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
                        text: "\$337.15",
                        style: TextStyle(fontSize: 20, color: Colors.black),
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
    );
  }
}
