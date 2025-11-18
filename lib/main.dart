import 'package:flutter/material.dart';
import 'package:pertemuaan7/model/product.dart';
import 'package:pertemuaan7/screen/halaman_keranjang.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Keranjang(),
      child: MyApp(),
      ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Aplikasi Belanja",
      debugShowCheckedModeBanner: false,
      home: HalamanBelanja(),
    );
  }
}

class HalamanBelanja extends StatelessWidget {
  const HalamanBelanja({super.key});

  @override
  Widget build(BuildContext context) {
    // buat product
    List<Product> produk = [
      Product('Keyboard'), 
      Product('Mouse'), 
      Product('Monitor')
      ];
    return Scaffold(
      appBar: AppBar(
        title: Text("Halaman Belanja"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 29, 216, 160),
        actions: [
          IconButton(
            onPressed: (){
              Navigator.push(
                context, MaterialPageRoute(
                  builder: (context) => HalamanKeranjang(),
                  )
                );
            },
             icon: Icon(Icons.shopping_cart))
        ],
      ),

      body: ListView.builder(
        itemCount: produk.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            elevation: 3,
            child: ListTile(
              title: Text(produk[index].nama),
              trailing: IconButton(
                onPressed: (){
                  Provider.of<Keranjang>(context, listen: false).add(produk[index]);
                }, 
                icon: Icon(Icons.shopping_cart_checkout)
                ),
            ),
          );
        },
        ),

    );
  }
}