import 'package:flutter/material.dart';
import 'package:pertemuaan7/model/product.dart';
import 'package:provider/provider.dart';

class HalamanKeranjang extends StatelessWidget {
  const HalamanKeranjang({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Halaman Keranjang",
          style: TextStyle(fontWeight: FontWeight.bold),
          ),
        centerTitle: true,
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),

      body: Consumer<Keranjang>(
        builder: (context, value, child) {

          if (value.items.isEmpty) {
            return Center(
              child: Text(
                "Keranjang masih kosong",
                style: TextStyle(fontSize: 18),
              ),
            );
          }

          return ListView.builder(
            itemCount: value.items.length,
            itemBuilder: (context, index) {
              final product = value.items[index];

              return Card(
                margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 4,
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,

                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        product.gambarUrl,
                        width: 65,
                        height: 65,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: 65,
                            height: 65,
                            color: Colors.grey.shade300,
                            child: Icon(Icons.image_not_supported),
                          );
                        },
                      ),
                    ),

                    title: Text(
                      product.nama,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),

                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        final namaItem = product.nama;

                        value.remove(product);

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("$namaItem dihapus dari keranjang"),
                            duration: Duration(seconds: 1),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
