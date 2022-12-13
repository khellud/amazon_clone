// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:amazon_clone/models/product.dart';

class Order {
  final String id;
  final String address;
  final String userId;
  final int orderAt;
  final int status;
  final int totalPrice;
  final List<Product> products;
  final List<int> quantity;
  Order({
    required this.id,
    required this.address,
    required this.userId,
    required this.orderAt,
    required this.status,
    required this.totalPrice,
    required this.products,
    required this.quantity,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'address': address,
      'userId': userId,
      'orderAt': orderAt,
      'status': status,
      'totalPrice': totalPrice,
      'products': products.map((x) => x.toMap()).toList(),
      'quantity': quantity,
    };
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      id: map['_id'] as String,
      address: map['address'] as String,
      userId: map['userId'] as String,
      orderAt: map['orderAt'] as int,
      status: map['status'] as int,
      totalPrice: map['totalPrice'] ?? 0,
      products: List<Product>.from(
        map['products']?.map(
          (x) => Product.fromMap(x['product']),
        ),
      ),
      quantity: List<int>.from(
        map['products']?.map(
          (x) => x['quantity'],
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Order.fromJson(String source) =>
      Order.fromMap(json.decode(source) as Map<String, dynamic>);
}
