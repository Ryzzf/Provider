import 'package:flutter/material.dart';

class Product {
  String nama;
  //pembuatan construct
  Product(this.nama); // <= KONSTRAKTOR
}

class Keranjang extends ChangeNotifier {
  List<Product> _items = [];
  List<Product> get items => _items;
  int get n => _items.length;

  //fungsi penambahan item ke keranjang
  void add(Product p) {
    _items.add(p);
    notifyListeners();
  }
}
