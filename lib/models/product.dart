import 'dart:convert';

import 'package:amazon_clone/models/rating.dart';

class Product {
  final String name;
  final String description;
  final int quantity;
  final String category;
  final double price;
  final String? id;
  final List<String> images;
  final List<Rating>? rating;
  Product({
    required this.name,
    required this.description,
    required this.quantity,
    required this.category,
    required this.price,
    required this.images,
    this.id,
    this.rating,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'quantity': quantity,
      'category': category,
      'price': price,
      'id': id,
      'images': images,
      'rating': rating,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      name: map["name"],
      description: map["description"],
      quantity: map["quantity"],
      category: map["category"],
      id: map["_id"],
      price: map["price"].toDouble(),
      images: List<String>.from(
        (map['images']),
      ),
      rating: map['ratings'] != null
          ? List<Rating>.from(
              map['ratings']?.map(
                (x) => Rating.fromMap(x),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);
}
