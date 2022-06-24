import 'package:flutter/material.dart';

import 'product.dart';

class OrderSummary {
  final Product product;
  // final int numOfItem;

  OrderSummary({required this.product});
}

// Demo data for our cart

List<OrderSummary> demoOrderSummary = [
  OrderSummary(product: demoProducts[0]),
  OrderSummary(product: demoProducts[1]),
  OrderSummary(product: demoProducts[2]),
];
