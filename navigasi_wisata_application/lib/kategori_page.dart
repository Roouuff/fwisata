// lib/kategori_page.dart
import 'package:flutter/material.dart';

import 'data_wisata.dart';

/// Satu halaman untuk semua kategori (Pantai, Gunung, Budaya, Kuliner).
/// Isi diambil dari data di data_wisata.dart.
class KategoriPage extends StatelessWidget {
  final Kategori kategori;

  /// Dipanggil saat tombol keluar ditekan (pindah ke tab Beranda).
  final VoidCallback? onKeluar;

  const KategoriPage({super.key, required this.kategori, this.onKeluar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: kategori.warna.shade800,
        foregroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          tooltip: 'Kembali',
          onPressed: onKeluar ?? () => Navigator.pop(context),
        ),
        title: Text(
          kategori.nama,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        key: PageStorageKey('kategori-${kategori.nama}'),
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            'Apa itu ${kategori.nama}?',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: kategori.warna.shade800,
            ),
          ),
          const SizedBox(height: 8),
          TeksDeskripsi(kategori.pengantar),
          const SizedBox(height: 20),
          for (final b in kategori.bagian) ..._bagian(context, b),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  List<Widget> _bagian(BuildContext context, Bagian b) {
    return [
      if (b.judul != null) ...[
        Text(
          b.judul!,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: kategori.warna.shade800,
          ),
        ),
        const SizedBox(height: 8),
      ],
      if (b.pengantar.isNotEmpty) ...[
        TeksDeskripsi(b.pengantar),
        const SizedBox(height: 12),
      ],
      Text(
        b.labelDaftar,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
      const SizedBox(height: 12),
      for (final w in b.daftar) _kartuWisata(context, w),
      const SizedBox(height: 12),
    ];
  }

  Widget _kartuWisata(BuildContext context, Wisata w) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                w.nama,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            if (w.gambar != null) ...[
              const SizedBox(height: 12),
              // Foto di tengah
              Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 500),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      w.gambar!,
                      width: double.infinity,
                      height: 220,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stack) => Container(
                        height: 220,
                        color: Colors.grey.shade300,
                        alignment: Alignment.center,
                        child: Text(
                          'Gambar tidak ditemukan:\n${w.gambar}',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
            const SizedBox(height: 12),
            // Deskripsi di bawah foto
            TeksDeskripsi(w.deskripsi),
            const SizedBox(height: 12),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Kirim nama tempat ke halaman Detail Wisata
                  Navigator.pushNamed(context, '/detail', arguments: w.nama);
                },
                child: const Text('Lihat Detail'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Teks deskripsi. Kalau masih berisi penanda [ISI ...], tampil oranye miring.
class TeksDeskripsi extends StatelessWidget {
  final String teks;

  const TeksDeskripsi(this.teks, {super.key});

  @override
  Widget build(BuildContext context) {
    final belumDiisi = teks.contains('[ISI');
    return Text(
      teks,
      textAlign: TextAlign.justify, // <-- TAMBAH BARIS INI
      style: TextStyle(
        fontSize: 15,
        height: 1.5,
        color: belumDiisi ? Colors.deepOrange : Colors.black87,
        fontStyle: belumDiisi ? FontStyle.italic : FontStyle.normal,
        fontWeight: belumDiisi ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
}


