# Wisata Jawa Timur

Aplikasi Flutter untuk menjelajahi informasi wisata di Jawa Timur. Konten disajikan dalam kategori pantai, gunung, budaya, dan kuliner, dengan beranda yang berisi pengantar, galeri, dan rekomendasi wisata.

## Fitur

- Beranda dengan gambar hero, pengantar Jawa Timur, galeri foto, dan rekomendasi wisata.
- Navigasi bawah untuk berpindah antara Beranda, Pantai, Gunung, Budaya, dan Kuliner.
- Halaman kategori berisi pengantar dan daftar tempat wisata beserta gambar dan deskripsinya.
- Tombol **Lihat Detail** membuka halaman yang menampilkan nama tempat wisata.
- Seluruh gambar disimpan sebagai aset lokal sehingga dapat ditampilkan tanpa mengambil gambar dari layanan eksternal.

## Teknologi

- Flutter dan Dart
- Material 3
- Aset gambar lokal

## Persyaratan

- Flutter SDK yang mendukung batas SDK Dart di `pubspec.yaml` (`^3.13.4`)
- Android Studio atau editor Flutter lain
- Emulator atau perangkat Android; Flutter juga dapat dijalankan pada platform lain yang didukung dan telah disiapkan

Periksa instalasi Flutter dan perangkat yang tersedia:

```bash
flutter doctor
flutter devices
```

## Menjalankan aplikasi

Dari direktori proyek ini, jalankan:

```bash
flutter pub get
flutter run
```

Untuk memilih perangkat tertentu:

```bash
flutter run -d <device-id>
```

## Menjalankan pengujian

```bash
flutter test
```

## Struktur proyek

```text
lib/
  main.dart                 # Titik masuk aplikasi dan konfigurasi rute
  main_page.dart            # Navigasi bawah dan halaman utama
  beranda_page.dart         # Beranda, galeri, dan rekomendasi
  kategori_page.dart        # Tampilan daftar wisata per kategori
  detail_wisata_page.dart  # Halaman nama tempat wisata
  data_wisata.dart          # Data kategori, wisata, dan teks
assets/
  beranda/                  # Gambar hero dan galeri
  pantai/                   # Gambar wisata pantai
  gunung/                   # Gambar wisata gunung
  budaya/                   # Gambar tradisi dan kesenian
  kuliner/                  # Gambar makanan khas
test/
  widget_test.dart          # Pengujian widget
```

## Mengubah data dan menambahkan gambar

- Konten kategori, deskripsi wisata, pengantar, dan data galeri berada di `lib/data_wisata.dart`.
- Daftar aset gambar yang disertakan aplikasi didaftarkan pada bagian `flutter.assets` di `pubspec.yaml`.
- Untuk menambahkan gambar, letakkan file di folder kategori yang sesuai, daftarkan path-nya di `pubspec.yaml`, lalu gunakan path tersebut pada data wisata atau galeri.
- Setelah mengubah daftar aset di `pubspec.yaml`, jalankan kembali `flutter pub get` dan mulai ulang aplikasi.

## Lisensi dan penggunaan

Proyek ini merupakan aplikasi informasi wisata. Pastikan hak penggunaan gambar dan materi yang ditambahkan ke proyek telah sesuai.
