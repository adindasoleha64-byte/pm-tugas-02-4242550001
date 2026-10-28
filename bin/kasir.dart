import 'dart:io';

void main() {
  final Map<String, ({String nama, String kategori, int harga})> katalog = {
    'P01': (nama: 'Kopi Sidikalang 250 g', kategori: 'Kopi', harga: 45000),
    'P02': (nama: 'Kopi Gayo 250 g', kategori: 'Kopi', harga: 55000),
    'P03': (nama: 'Teh Kayu Aro 100 g', kategori: 'Teh', harga: 25000),
    'P04': (nama: 'Gula Aren 500 g', kategori: 'Pemanis', harga: 30000),
    'P05': (nama: 'Bolu Meranti', kategori: 'Makanan', harga: 80000),
  };

  print('KATALOG TOKO');
    // header tabel
  print('${'Kode'.padRight(6)}${'Nama'.padRight(24)}${'Harga'.padLeft(12)}');
  print('-' * 42);

  // satu baris untuk tiap produk
  for (final e in katalog.entries) {
    final kode = e.key;
    final nama = e.value.nama;
    final harga = e.value.harga;
    print('${kode.padRight(6)}${nama.padRight(24)}${harga.toString().padLeft(12)}');
  }
}
