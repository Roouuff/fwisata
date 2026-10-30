// lib/beranda_page.dart
import 'package:flutter/material.dart';

import 'data_wisata.dart';
import 'kategori_page.dart' show TeksDeskripsi;

class BerandaPage extends StatelessWidget {
  const BerandaPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Rekomendasi = semua wisata yang punya foto
    final rekomendasi = <(Kategori, Wisata)>[
      for (final k in semuaKategori)
        for (final b in k.bagian)
          for (final w in b.daftar)
            if (w.gambar != null) (k, w),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7F8),
      appBar: AppBar(title: const Text('Wisata Indonesia'), centerTitle: true),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          _hero(),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _judulBagian('Jelajahi Kategori'),
                const SizedBox(height: 12),
                _menuCepat(context),
                const SizedBox(height: 28),
                _judulBagian('Tentang Jawa Timur'),
                const SizedBox(height: 12),
                Card(
                  elevation: 0,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(16),
                    child: TeksDeskripsi(deskripsiJatim),
                  ),
                ),
                const SizedBox(height: 28),
                _judulBagian('Galeri Jawa Timur'),
                const SizedBox(height: 12),
              ],
            ),
          ),
          _galeri(),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 28, 16, 12),
            child: _judulBagian('Rekomendasi Wisata'),
          ),
          _rekomendasi(context, rekomendasi),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  // ------------------------------------------------------------ HERO
  Widget _hero() {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(32),
          ),
          child: SizedBox(
            height: 220,
            width: double.infinity,
            child: Stack(
              fit: StackFit.expand,
              children: [
                _gambar(fotoHeroJatim),
                const DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.black26, Colors.black54],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const Positioned(
          left: 24,
          right: 24,
          bottom: 32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Selamat Datang di',
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
              SizedBox(height: 4),
              Text(
                'Wisata Jawa Timur',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ------------------------------------------------------ MENU CEPAT
  Widget _menuCepat(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      childAspectRatio: 1.8,
      children: [
        for (final kategori in semuaKategori)
          Card(
            margin: EdgeInsets.zero,
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () => Navigator.pushNamed(
                context,
                '/${kategori.nama.toLowerCase()}',
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(kategori.ikon, size: 32, color: kategori.warna),
                  const SizedBox(height: 6),
                  Text(
                    kategori.nama,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }

  // ----------------------------------------------------------- GALERI
  Widget _galeri() {
    return SizedBox(
      height: 190,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: galeriJatim.length,
        separatorBuilder: (context, i) => const SizedBox(width: 12),
        itemBuilder: (context, i) {
          final f = galeriJatim[i];
          return ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: SizedBox(
              width: 280,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  _gambar(f.gambar),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.transparent, Colors.black87],
                        ),
                      ),
                      child: Text(
                        f.keterangan,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(color: Colors.white),
                      ),
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

  // ------------------------------------------------------ REKOMENDASI
  Widget _rekomendasi(BuildContext context, List<(Kategori, Wisata)> data) {
    return SizedBox(
      height: 230,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: data.length,
        separatorBuilder: (context, i) => const SizedBox(width: 12),
        itemBuilder: (context, i) {
          final (k, w) = data[i];
          return SizedBox(
            width: 190,
            child: Card(
              elevation: 3,
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: InkWell(
                // Kirim nama wisata ke halaman Detail Wisata
                onTap: () =>
                    Navigator.pushNamed(context, '/detail', arguments: w.nama),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          _gambar(w.gambar!),
                          Positioned(
                            top: 8,
                            left: 8,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: k.warna,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                k.nama,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        w.nama,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // ------------------------------------------------------------ UTIL
  Widget _judulBagian(String teks) {
    return Text(
      teks,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }

  /// Gambar dari assets. Kalau file belum ada, tampil kotak penanda.
  Widget _gambar(String path) {
    return Image.asset(
      path,
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
      errorBuilder: (context, error, stack) => Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal.shade300, Colors.teal.shade700],
          ),
        ),
        alignment: Alignment.center,
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.image_outlined, color: Colors.white70, size: 36),
            const SizedBox(height: 6),
            Text(
              '[ISI FOTO]\n$path',
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white70, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}

