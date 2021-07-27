import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  Product(
      {this.id,
      @required this.title,
      @required this.description,
      @required this.price,
      @required this.imageUrl,
      this.isFavorite = false});

  void _toogleFavarite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }

  Future<void> toggleFavorite() async {
    _toogleFavarite();

    try {
      final url =
          'https://flutter-shop-e84ba-default-rtdb.firebaseio.com/products/$id.json';
      final response = await http.patch(
        url,
        body: json.encode(
          {'isFavorite': isFavorite},
        ),
      );
      if (response.statusCode >= 400) {
        _toogleFavarite();
      }
    } catch (error) {
      _toogleFavarite();
    }
  }
}
