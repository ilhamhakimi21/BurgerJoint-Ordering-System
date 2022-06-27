import 'package:flutter/material.dart';

class Product {
  final String m_name;
  final double m_price;
  late int m_quantity;

  Product({
    required this.m_name,
    required this.m_price,
    required this.m_quantity,
  });
}

// List<Product> demoProducts = [
//   Product(m_name: 'Burger', m_price: 5.00, m_quantity: 3),
//   Product(m_name: "Fries", m_price: 4.30, m_quantity: 2),
//   Product(m_name: "Coke", m_price: 3.30, m_quantity: 1)
// ];
