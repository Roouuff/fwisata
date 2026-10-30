// lib/main_page.dart
import 'package:flutter/material.dart';

import 'beranda_page.dart';
import 'data_wisata.dart';
import 'kategori_page.dart';

/// Halaman utama: 5 tab di bottomNavigationBar
/// Beranda | Pantai | Gunung | Budaya | Kuliner
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _index = 0;

  void _ganti(int i) => setState(() => _index = i);

  @override
  Widget build(BuildContext context) {
    final halaman = <Widget>[
      BerandaPage(onPilihTab: _ganti),
      for (final k in semuaKategori)
        KategoriPage(kategori: k, onKeluar: () => _ganti(0)),
    ];

    return Scaffold(
      // IndexedStack: posisi scroll tiap tab tetap tersimpan
      body: IndexedStack(index: _index, children: halaman),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: _ganti,
        destinations: [
          const NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Beranda',
          ),
          for (final k in semuaKategori)
            NavigationDestination(
              icon: Icon(k.ikon),
              label: k.nama,
            ),
        ],
      ),
    );
  }
}