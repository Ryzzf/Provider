import 'package:flutter/material.dart';
import 'package:pertemuaan7/model/product.dart';
import 'package:pertemuaan7/screen/halaman_keranjang.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Keranjang(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Aplikasi Belanja",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.teal,
        useMaterial3: true,
      ),
      home: HalamanBelanja(),
    );
  }
}

class HalamanBelanja extends StatelessWidget {
  const HalamanBelanja({super.key});

  @override
  Widget build(BuildContext context) {
    List<Product> produk = [
      Product(
        'AES Turbo Gen 2',
        'https://img.lazcdn.com/g/ff/kf/S07f2e9c89d354627ba535cf88ca67e52O.jpg_720x720q80.jpg',
      ),
      Product(
        'AES BI-LED SQL',
        'https://id-test-11.slatic.net/p/dff5994a8cfa6da12154880c9c4b0ef1.jpg',
      ),
      Product(
        'VND AK 55 Ring 17',
        'https://laz-img-sg.alicdn.com/p/20c6bfb5f07b5bd4c580cf585a354f00.jpg',
      ),
      Product(
        'Shockbreaker YSS G-Racing',
        'https://img.lazcdn.com/g/p/0f7c6d9da2c80e370dddcb6dc06ace86.jpg_720x720q80.jpg',
      ),
      Product(
        'Master Rem RPD',
        'https://filebroker-cdn.lazada.co.id/kf/S4704bfde3fc845e38c572043470d45e30.jpg',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sparepart Motor",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        elevation: 4,
        shadowColor: Colors.black45,

        actions: [
          Stack(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HalamanKeranjang(),
                    ),
                  );
                },
                icon: Icon(Icons.shopping_cart_outlined, size: 30),
              ),

              Positioned(
                right: 4,
                top: 4,
                child: Consumer<Keranjang>(
                  builder: (context, keranjang, child) {
                    return keranjang.jumlah == 0
                        ? SizedBox()
                        : Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              '${keranjang.jumlah}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                  },
                ),
              ),
            ],
          ),
        ],
      ),

      body: ListView.builder(
        padding: EdgeInsets.all(12),
        itemCount: produk.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.only(bottom: 12),
            elevation: 4,
            shadowColor: Colors.black26,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Container(
              padding: EdgeInsets.all(14),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      produk[index].gambarUrl,
                      width: 70,
                      height: 70,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          Container(
                            width: 70,
                            height: 70,
                            color: Colors.grey.shade300,
                            child: Icon(Icons.image_not_supported),
                          ),
                    ),
                  ),

                  SizedBox(width: 16),

                  Expanded(
                    child: Text(
                      produk[index].nama,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: 14, vertical: 10),
                    ),
                    onPressed: () {
                      Provider.of<Keranjang>(context, listen: false)
                          .add(produk[index]);

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "${produk[index].nama} ditambahkan!",
                            style: TextStyle(fontSize: 16),
                          ),
                          duration: Duration(seconds: 1),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Icon(Icons.add_shopping_cart, size: 18),
                        SizedBox(width: 6),
                        Text("Tambah"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
