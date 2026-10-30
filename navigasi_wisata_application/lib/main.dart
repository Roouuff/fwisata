// lib/main.dart
import 'package:flutter/material.dart';

import 'detail_wisata_page.dart';
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
      theme: ThemeData(
        colorSchemeSeed: Colors.teal,
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        // '/' = halaman utama dengan bottom navigation (5 tab)
        '/': (context) => const MainPage(),
        '/detail': (context) => const DetailWisataPage(),
      },
    );
  }
}