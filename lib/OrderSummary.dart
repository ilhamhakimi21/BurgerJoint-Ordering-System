import 'package:flutter/material.dart';

import 'product.dart';

class OrderSummary {
  final Product product;
  // final int numOfItem;
  late double totalprice = 0;

  OrderSummary({required this.product});
}

// Demo data for our cart
List<OrderSummary> demoOrderSummary = [
  OrderSummary(
      product: Product(m_name: 'Burgers', m_price: 5.00, m_quantity: 3)),
  OrderSummary(product: Product(m_name: "Fries", m_price: 4.00, m_quantity: 2)),
  OrderSummary(product: Product(m_name: "Coke", m_price: 3.00, m_quantity: 1)),
];
