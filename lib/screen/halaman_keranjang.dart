import 'package:flutter/material.dart';
import 'package:pertemuaan7/model/product.dart';
import 'package:provider/provider.dart';

class HalamanKeranjang extends StatelessWidget {
  const HalamanKeranjang({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Halaman Keranjang"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 29, 216, 160),
      ),
      body: Consumer<Keranjang>(
        builder: (context, value, child) {
          if (value.items.isEmpty) {
            return Text("Keranjang Masih Kosong");
          }
          //kalo ada data
          return ListView.builder(
            itemCount: value.items.length,
            itemBuilder: (context, index) {
              return Card(
                child: Text(value.items[index].nama),
              );
            },
          );
        },
      ),
    );
  }
}
