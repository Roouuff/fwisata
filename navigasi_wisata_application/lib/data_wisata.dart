// lib/data_wisata.dart
//
// SEMUA ISI TEKS ADA DI FILE INI.
// Cari tulisan  [ISI DESKRIPSI DI SINI]  lalu ganti dengan teks kamu.
// Di aplikasi, teks yang masih kosong tampil ORANYE miring supaya mudah ketahuan.
//
// Tambah wisata baru: copy satu blok  Wisata( ... ),  di dalam daftar, lalu ubah.
import 'package:flutter/material.dart';

/// Penanda deskripsi yang belum diisi. Jangan dihapus dari fungsi pengecekan.
const String isiDeskripsi = '[ISI DESKRIPSI DI SINI]';

// ------------------------------------------------------------- BERANDA
// Foto besar di bagian atas beranda.
// TODO: siapkan fotonya, simpan di assets/beranda/hero.jpg
const String fotoHeroJatim = 'assets/beranda/hero.jpg';

// TODO: isi deskripsi tentang Jawa Timur
const String deskripsiJatim = 'Jawa Timur adalah provinsi di Indonesia yang terletak di bagian timur Pulau Jawa. Provinsi ini memiliki keanekaragaman budaya, alam, dan kuliner yang kaya. Dari pantai eksotis hingga gunung yang menakjubkan, Jawa Timur menawarkan pengalaman wisata yang beragam bagi para pengunjung. Budaya lokal yang unik, tradisi yang kaya, serta kuliner khas yang menggugah selera menjadikan Jawa Timur sebagai destinasi menarik untuk dijelajahi.';

class FotoJatim {
  final String gambar;
  final String keterangan;

  const FotoJatim({required this.gambar, this.keterangan = '[ISI KETERANGAN FOTO]'});
}

// Galeri foto Jawa Timur (geser ke samping di beranda).
// Tambah foto: salin satu baris FotoJatim(...), lalu daftarkan di pubspec.yaml.
// Ganti teks di keterangan: ... dengan keterangan tiap foto (beda-beda).
const List<FotoJatim> galeriJatim = [
  FotoJatim(
    gambar: 'assets/beranda/jatim1.jpg',
    keterangan: '[Hari Jadi Jawa Timur]', // TODO
  ),
  FotoJatim(
    gambar: 'assets/beranda/jatim2.jpg',
    keterangan: '[Alun-Alun Kota Batu (Batu City Square)]', // TODO
  ),
  FotoJatim(
    gambar: 'assets/beranda/jatim3.jpg',
    keterangan: '[Gedung Balai Pemuda, di kawasan Alun-Alun Surabaya]', // TODO
  ),
  FotoJatim(
    gambar: 'assets/beranda/jatim4.jpg',
    keterangan: '[Gereja Merah (Gereja Protestan di Indonesia bagian Barat / GPIB Immanuel)]', // TODO
  ),
  FotoJatim(
    gambar: 'assets/beranda/jatim5.jpg',
    keterangan: '[De Djawatan (Fangorn Forest), di Kabupaten Banyuwangi]', // TODO
  ),
  FotoJatim(
    gambar: 'assets/beranda/jatim6.jpg',
    keterangan: '[Monumen Kapal Mojopahit (Taman Kapal Selamat Datang), di kawasan Mojokerto]', // TODO
  ),
];

/// Urutan kategori = urutan tab di bottom navigation (setelah Beranda).
const List<Kategori> semuaKategori = [
  dataPantai,
  dataGunung,
  dataBudaya,
  dataKuliner,
];

class Wisata {
  final String nama;
  final String? gambar; // null = tanpa foto (teks saja)
  final String deskripsi;

  const Wisata({
    required this.nama,
    this.gambar,
    this.deskripsi = isiDeskripsi,
  });
}

/// Satu kelompok daftar. Pantai/Gunung/Kuliner punya 1 bagian.
/// Budaya punya 3 bagian (tradisi, kesenian, karakter masyarakat).
class Bagian {
  final String? judul; // null = tanpa judul bagian
  final String pengantar; // penjelasan umum bagian ('' = tidak tampil)
  final String labelDaftar; // kalimat pembuka daftar
  final List<Wisata> daftar;

  const Bagian({
    this.judul,
    this.pengantar = '',
    required this.labelDaftar,
    required this.daftar,
  });
}

class Kategori {
  final String nama;
  final IconData ikon;
  final MaterialColor warna;
  final String pengantar; // penjelasan umum kategori
  final List<Bagian> bagian;

  const Kategori({
    required this.nama,
    required this.ikon,
    required this.warna,
    required this.pengantar,
    required this.bagian,
  });
}

// ---------------------------------------------------------------- PANTAI
const Kategori dataPantai = Kategori(
  nama: 'Pantai',
  ikon: Icons.beach_access,
  warna: Colors.blue,
  // TODO: isi penjelasan umum "pantai adalah ..."
  pengantar: 'Pantai merupakan kawasan geografis yang menjadi batas pertemuan antara daratan dan wilayah lautan. Selain memiliki peran ekologis yang penting, pantai menjadi salah satu destinasi wisata alam favorit karena menyajikan pemandangan cakrawala yang luas, hamparan pasir, serta deburan ombak yang menenangkan. Di Jawa Timur, terdapat deretan pantai eksotis dengan keunikan bentang alam yang beragam, mulai dari pantai berpasir putih hingga tebing karang yang megah.',
  bagian: [
    Bagian(
      labelDaftar: 'Di Jawa Timur ada beberapa pantai, sebagai berikut:',
      daftar: [
        Wisata(
          nama: 'Pantai Klayar',
          gambar: 'assets/pantai/klayar.jpg',
          deskripsi: 'Pantai Klayar adalah destinasi alam eksotis di Pacitan dengan hamparan pasir putih bersih dan panorama tebing karang yang megah. Keunikan utamanya terletak pada batu karang menyerupai patung Sphinx serta fenomena Seruling Samudra yang menyemburkan air laut tinggi ke udara disertai suara siulan alami.',
        ),
        Wisata(
          nama: 'Pantai Papuma',
          gambar: 'assets/pantai/papuma.jpg',
          deskripsi: 'Pantai Papuma adalah destinasi alam eksotis di Jember dengan hamparan pasir putih bersih dan panorama gugusan batu karang yang megah di tengah laut. Keunikan utamanya terletak pada perpaduan keindahan pesisir pantai dengan cagar alam hutan yang asri, serta pesona panorama matahari terbit dan terbenam.',
        ),
        Wisata(
          nama: 'Pantai Tiga Warna',
          gambar: 'assets/pantai/tigawarna.jpg',
          deskripsi: 'Pantai Tiga Warna adalah destinasi alam eksotis di Malang yang memukau dengan gradasi tiga warna air lautnya yang unik. Berada di kawasan konservasi, pantai berpasir bersih ini menawarkan pesona terumbu karang yang terjaga, keasrian hutan mangrove, serta keseruan aktivitas snorkeling.',
        ),
      ],
    ),
  ],
);

// ---------------------------------------------------------------- GUNUNG
const Kategori dataGunung = Kategori(
  nama: 'Gunung',
  ikon: Icons.terrain,
  warna: Colors.green,
  // TODO: isi penjelasan umum "gunung adalah ..."
  pengantar: 'Gunung adalah bentang alam yang menonjol di permukaan bumi, biasanya memiliki ketinggian yang signifikan dibandingkan dengan daerah sekitarnya. Gunung terbentuk melalui proses geologi seperti aktivitas tektonik dan vulkanik, dan sering kali menjadi simbol keindahan alam serta tantangan bagi para pendaki. Di Jawa Timur, terdapat sejumlah gunung yang menawarkan pemandangan spektakuler dan keanekaragaman ekosistem yang menarik untuk dijelajahi.',
  bagian: [
    Bagian(
      labelDaftar: 'Di Jawa Timur ada beberapa gunung, sebagai berikut:',
      daftar: [
        Wisata(
          nama: 'Gunung Semeru (3.676 mdpl)',
          gambar: 'assets/gunung/semeru.jpg',
          deskripsi: 'Gunung Semeru adalah gunung tertinggi di Pulau Jawa yang menawarkan keindahan alam spektakuler di Jawa Timur. Gunung berapi aktif ini sangat terkenal dengan pesona keasrian Danau Ranu Kumbolo, hamparan padang savana Oro-Oro Ombo, serta Puncak Mahameru yang megah dan ikonik.',
        ),
        Wisata(
          nama: 'Gunung Raung (3.150 mdpl)',
          gambar: 'assets/gunung/raung.jpg',
          deskripsi: 'Gunung Raung adalah gunung berapi aktif di Jawa Timur yang terkenal dengan kaldera raksasanya yang menakjubkan. Gunung ini menawarkan jalur pendakian paling ekstrem di Pulau Jawa, dengan medan tebing berjurang menuju Puncak Sejati yang menantang adrenalin serta pemandangan alam yang megah.',
        ),
        Wisata(
          nama: 'Gunung Arjuno (3.339 mdpl)',
          gambar: 'assets/gunung/arjuno.jpg',
          deskripsi: 'Gunung Arjuno adalah gunung tertinggi kedua di Jawa Timur yang menawarkan panorama alam megah dan jalur pendakian yang ikonik. Gunung ini terkenal dengan pesona Sabana Lali Jiwo, peninggalan situs sejarah di sepanjang jalur, serta Puncak Ogal-Agil yang menyajikan pemandangan spektakuler.',
        ),
        // Tambah gunung lain di sini
      ],
    ),
  ],
);

// ---------------------------------------------------------------- BUDAYA
const Kategori dataBudaya = Kategori(
  nama: 'Budaya',
  ikon: Icons.theater_comedy,
  warna: Colors.deepOrange,
  // TODO: isi penjelasan umum "budaya adalah ..."
  pengantar: 'Budaya adalah keseluruhan cara hidup, tradisi, nilai-nilai, dan ekspresi kreatif yang berkembang dalam suatu masyarakat. Budaya mencakup berbagai aspek kehidupan, termasuk seni, musik, tarian, bahasa, adat istiadat, dan ritual keagamaan. Di Jawa Timur, budaya yang kaya dan beragam tercermin dalam tradisi unik, kesenian ikonik, serta karakter masyarakat yang membentuk identitas daerah ini.',
  bagian: [
    // 1. Tradisi & Ritual (ada foto)
    Bagian(
      judul: 'Kekayaan Tradisi & Ritual',
      // TODO: isi penjelasan umum "tradisi dan ritual adalah ..."
      pengantar: 'Tradisi dan ritual adalah bagian penting dari budaya masyarakat, yang mencerminkan nilai-nilai dan keyakinan yang diwariskan dari generasi ke generasi. Di Jawa Timur, tradisi dan ritual memiliki keunikan dan kebermaknaan tersendiri.',
      labelDaftar:
          'Jawa Timur menjadi rumah bagi berbagai tradisi dan ritual yang kaya, di antaranya:',
      daftar: [
        Wisata(
          nama: 'Tradisi Yadnya Kasada',
          gambar: 'assets/budaya/tkasada.jpg',
          deskripsi: 'Yadnya Kasada adalah ritual adat suku Tengger di kawasan Gunung Bromo, Jawa Timur, yang digelar setiap bulan Kasada. Tradisi Hindu ini dilakukan dengan melempar hasil bumi, ternak, dan sesaji ke kawah Bromo sebagai wujud rasa syukur dan penghormatan kepada Sang Hyang Widhi serta para leluhur.',
        ),
        // Tambah tradisi lain di sini
        Wisata(
          nama: 'Tradisi Larung Semboyo',
          gambar: 'assets/budaya/tlarungsemboyo.jpg',
          deskripsi: 'Tradisi Larung Sembonyo adalah upacara adat pesisir Teluk Prigi di Trenggalek, Jawa Timur, sebagai wujud rasa syukur para nelayan atas limpahan hasil laut. Ritual ini ditandai dengan melarungkan tumpeng dan hasil bumi ke tengah laut sebagai doa keselamatan serta keberkahan rezeki.',
        ),
         Wisata(
          nama: 'Tradisi Karapan Sapi',
          gambar: 'assets/budaya/tkarapansapi.jpg',
          deskripsi: 'Karapan Sapi adalah tradisi pacuan sapi khas masyarakat Madura, Jawa Timur, yang menampilkan sepasang sapi jantan berlari kencang menghela kereta kayu. Tradisi peninggalan leluhur ini diselenggarakan sebagai pesta rakyat usai panen sekaligus ajang bergengsi untuk menampilkan ketangkasan, kecepatan, dan budaya lokal yang meriah.',
        ),
      ],
    ),
    // 2. Kesenian Ikonik (ada foto)
    Bagian(
      judul: 'Kesenian Ikonik',
      // TODO: isi penjelasan umum "kesenian adalah ..."
      pengantar: 'Kesenian adalah ekspresi kreatif yang mencerminkan identitas budaya suatu masyarakat. Di Jawa Timur, kesenian ikonik mencakup berbagai bentuk pertunjukan, musik, dan tarian yang diwariskan secara turun-temurun, serta menjadi simbol kebanggaan lokal dan daya tarik wisata budaya.',
      labelDaftar: 'Di Jawa Timur ada beberapa kesenian, sebagai berikut:',
      daftar: [
        Wisata(
          nama: 'Kesenian Reog Ponorogo',
          gambar: 'assets/budaya/kreog.jpg',
          deskripsi: 'Reog Ponorogo adalah kesenian tari tradisional khas Ponorogo, Jawa Timur, yang menampilkan perpaduan keperkasaan dan keindahan budaya lokal. Kesenian ini terkenal dengan atraksi ikonik penari yang mengangkat topeng Dadak Merak raksasa berhiaskan kepala singa hanya dengan menggunakan kekuatan gigitan giginya.',
        ),
        // Tambah kesenian lain di sini
         Wisata(
          nama: 'Kesenian Tari Remo',
          gambar: 'assets/budaya/ktariremo.jpg',
          deskripsi: 'Tari Remo adalah seni tari tradisional khas Jawa Timur yang diciptakan sebagai tarian penyambutan tamu agung. Tarian ini terkenal dengan gerakannya yang tegas dan dinamis, hentakan kaki berhias gongseng yang gemerincing, serta mimik wajah ekspresif yang menggambarkan keberanian dan keluhuran budaya lokal.',
        ),
        Wisata(
          nama: 'Kesenian Ludruk',
          gambar: 'assets/budaya/kludruk.jpg',
          deskripsi: 'Ludruk adalah teater drama tradisional khas Jawa Timur yang menceritakan kisah kehidupan sehari-hari masyarakat lewat pertunjukan humor yang merakyat. Kesenian ini terkenal dengan dialog dialek Jawa Timuran yang spontan dan lugas, serta diawali dengan pertunjukan Tari Remo dan nyanyian kidungan.',
        ),
      ],
    ),
    // 3. Karakter Masyarakat (TANPA foto, teks saja)
    Bagian(
      judul: 'Karakter Masyarakat',
      // TODO: isi penjelasan umum "budaya karakter masyarakat adalah ..."
      pengantar: 'Karakter masyarakat adalah ciri khas yang membedakan suatu komunitas dari komunitas lain, termasuk nilai-nilai, sikap, dan perilaku yang berkembang dalam konteks budaya dan lingkungan sosial mereka. Di Jawa Timur, karakter masyarakat terlihat dalam sikap ramah tamah, keberanian, dan rasa ingin tahu yang tinggi.',
      labelDaftar:
          'Di Jawa Timur ada beberapa budaya karakter masyarakat, sebagai berikut:',
      daftar: [
        Wisata(
          nama: 'Budaya Arek',
          deskripsi: 'Budaya Arek adalah subkultur khas masyarakat Jawa Timur di kawasan Surabaya, Malang, dan sekitarnya. Karakter utamanya tercermin dari sikap egaliter, terbuka, dan lugas dalam berkomunikasi, serta memiliki jiwa solidaritas yang tinggi, semangat pantang menyerah, dan keramahan yang kental dalam kehidupan bermasyarakat.',
        ),
         Wisata(
          nama: 'Budaya Mataraman',
          deskripsi: 'Budaya Mataraman adalah subkultur khas Jawa Timur di wilayah bagian barat dan selatan, seperti Madiun, Kediri, dan Blitar. Dipengaruhi oleh tradisi Keraton Mataram, subkultur ini kental dengan tata krama yang halus, norma kesopanan yang tinggi, serta kelestarian tradisi Jawa yang adiluhung.',
        ),
        // Tambah karakter masyarakat lain di sini
         Wisata(
          nama: 'Budaya Pandalungan',
          deskripsi: 'Budaya Pandalungan adalah subkultur unik di kawasan Tapal Kuda Jawa Timur yang lahir dari pencampuran harmonis antara budaya Jawa dan Madura. Subkultur ini membentuk karakter masyarakat yang terbuka, adaptif, dan ekspresif, serta melahirkan tradisi, seni, dan bahasa daerah yang khas.',
        ),
      ],
    ),
  ],
);

// --------------------------------------------------------------- KULINER
const Kategori dataKuliner = Kategori(
  nama: 'Kuliner',
  ikon: Icons.restaurant,
  warna: Colors.red,
  // TODO: isi penjelasan umum "kuliner adalah ..."
  pengantar: 'Kuliner adalah seni dan praktik dalam menyiapkan, memasak, dan menyajikan makanan. Kuliner mencerminkan identitas budaya suatu daerah melalui cita rasa, bahan lokal, dan teknik memasak yang khas. Di Jawa Timur, kuliner menawarkan beragam hidangan tradisional yang kaya akan rempah-rempah dan cita rasa unik, menjadi daya tarik bagi wisatawan yang ingin mengeksplorasi kelezatan kuliner lokal.',
  bagian: [
    Bagian(
      labelDaftar: 'Di Jawa Timur ada beberapa kuliner, sebagai berikut:',
      daftar: [
        Wisata(
          nama: 'Soto Lamongan',
          gambar: 'assets/kuliner/stlamongan.jpg',
          deskripsi: 'Soto Lamongan adalah kuliner khas Jawa Timur berupa hidangan berkuah kaldu ayam kuning yang gurih dan kaya rempah. Keunikan utamanya terletak pada taburan bubuk koya gurih berbahan kerupuk udang, dipadukan dengan suwiran ayam, soun, telur, serta kucuran jeruk nipis segar.',
        ),
        // Tambah kuliner lain di sini
        Wisata(
          nama: 'Rawon',
          gambar: 'assets/kuliner/rawon.jpg',
          deskripsi: 'Rawon adalah kuliner sup daging sapi khas Jawa Timur yang terkenal dengan kuah hitam pekat beraroma rempah kuat. Warna hitam unik dan rasa gurih yang khas ini berasal dari penggunaan bumbu kluwek, disajikan hangat bersama tauge mentah, telur asin, dan sambal terasi.',
        ),
        Wisata(
          nama: 'Rujak Cingur',
          gambar: 'assets/kuliner/rjkcingur.jpg',
          deskripsi: 'Rujak Cingur adalah kuliner tradisional khas Jawa Timur yang terkenal dengan perpaduan unik antara irisan cingur (hidung sapi) rebus, lontong, tempe, serta aneka sayur dan buah. Seluruh bahan disiram bumbu petis udang pekat yang gurih, menciptakan cita rasa pedas manis autentik yang melegenda.',
        ),
        Wisata(
          nama: 'Pecel Madiun',
          gambar: 'assets/kuliner/pclmadiun.jpg',
          deskripsi: 'Pecel Madiun adalah kuliner khas Jawa Timur berupa aneka sayuran rebus yang disiram bumbu kacang gurih pedas beraroma daun jeruk yang khas. Hidangan ini umumnya disajikan di atas pincuk daun pisang bersama nasi hangat, tempe bacem, serta kerenyahan rempeyek kacang atau teri.',
        ),
      ],
    ),
  ],
);