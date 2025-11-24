import 'package:flutter/material.dart';

class Product {
  String nama;
  String gambarUrl;

  Product(this.nama, this.gambarUrl);
}


class Keranjang extends ChangeNotifier {
  List<Product> _items = [];

  List<Product> get items => _items;

  int get jumlah => _items.length;

  void add(Product p) {
    _items.add(p);
    notifyListeners();
  }

  void remove(Product p) {
    _items.remove(p);
    notifyListeners();
  }
}
