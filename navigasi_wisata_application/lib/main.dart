// lib/main.dart
import 'package:flutter/material.dart';

import 'data_wisata.dart';
import 'detail_wisata_page.dart';
import 'kategori_page.dart';
import 'main_page.dart';

void main() {
  runApp(const WisataApp());
}

class WisataApp extends StatelessWidget {
  const WisataApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wisata Indonesia',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.teal, useMaterial3: true),
      initialRoute: '/',
      routes: {
        '/': (context) => const MainPage(),
        '/pantai': (context) => const KategoriPage(kategori: dataPantai),
        '/gunung': (context) => const KategoriPage(kategori: dataGunung),
        '/budaya': (context) => const KategoriPage(kategori: dataBudaya),
        '/kuliner': (context) => const KategoriPage(kategori: dataKuliner),
        '/detail': (context) => const DetailWisataPage(),
      },
    );
  }
}
