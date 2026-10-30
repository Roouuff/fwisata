# E. Pertanyaan Evaluasi

## 1. Apa yang dimaksud dengan routing dan navigasi pada Flutter?

Routing adalah pengaturan jalur atau nama untuk membuka halaman tertentu di dalam aplikasi. Navigasi adalah proses berpindah dari satu halaman ke halaman lain. Pada aplikasi Wisata Jawa Timur, rute bernama digunakan untuk membuka halaman kategori dan halaman detail wisata. Sementara itu, menu navigasi bawah berpindah antara Beranda, Pantai, Gunung, Budaya, dan Kuliner dengan mengubah tab yang aktif.

## 2. Jelaskan fungsi widget `Navigator` dalam perpindahan antarhalaman.

`Navigator` mengelola tumpukan (stack) halaman atau route. Aplikasi dapat menambahkan halaman baru di atas halaman yang sedang dibuka, lalu kembali dengan menghapus halaman paling atas dari tumpukan. Pada aplikasi ini, tombol **Lihat Detail** memakai `Navigator.pushNamed()` untuk membuka halaman detail, sedangkan tombol **Kembali** di halaman detail memakai `Navigator.pop()` untuk kembali ke halaman sebelumnya.

## 3. Apa perbedaan `Navigator.pushNamed()` dan `Navigator.pop()`?

- `Navigator.pushNamed(context, '/detail')` membuka route bernama dan menambahkannya ke atas tumpukan navigasi. Aplikasi ini juga mengirim nama tempat wisata sebagai argumen saat membuka route tersebut.
- `Navigator.pop(context)` menutup route yang sedang berada di paling atas tumpukan dan mengembalikan pengguna ke route sebelumnya. Pada halaman detail, fungsi ini dipanggil oleh tombol **Kembali**.

## 4. Apa fungsi `initialRoute` dan `routes` pada `MaterialApp`?

- `initialRoute` menentukan route pertama yang dibuka saat aplikasi dimulai. Pada aplikasi ini nilainya `'/'`, yang menampilkan `MainPage`.
- `routes` berisi pemetaan nama route ke widget halaman yang harus ditampilkan. Aplikasi ini memetakan `'/'` ke `MainPage`, `'/pantai'`, `'/gunung'`, `'/budaya'`, dan `'/kuliner'` ke halaman kategori yang sesuai, serta `'/detail'` ke `DetailWisataPage`.

## 5. Bagaimana cara mengirim data dari satu halaman ke halaman lainnya?

Data dapat dikirim melalui argumen pada navigasi bernama dengan parameter `arguments`, lalu dibaca di halaman tujuan melalui `ModalRoute`. Dalam aplikasi ini, halaman kategori mengirim nama wisata saat tombol **Lihat Detail** ditekan:

```dart
Navigator.pushNamed(context, '/detail', arguments: w.nama);
```

Halaman `DetailWisataPage` mengambil nama tersebut melalui `ModalRoute.of(context)!.settings.arguments` dan menampilkannya.

## 6. Apa fungsi `GridView.count` dalam aplikasi yang dibuat?

`GridView.count` menampilkan widget dalam susunan grid dengan jumlah kolom yang ditentukan. Pada beranda aplikasi ini, `crossAxisCount: 2` membuat menu kategori tersusun dalam dua kolom. Setiap item kategori dapat ditekan untuk membuka halaman kategori terkait. `shrinkWrap: true` membuat grid menyesuaikan tinggi dengan isinya, sedangkan `NeverScrollableScrollPhysics` mencegah grid menggulir sendiri karena grid berada di dalam konten beranda yang dapat digulir.
