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
    print(
      '${kode.padRight(6)}${nama.padRight(24)}${harga.toString().padLeft(12)}',
    );
  }

  stdout.write('Pesanan (contoh: P01x2, P03x1): ');
  final String input = stdin.readLineSync() ?? '';
  final List<String> items = input.split(',');

  for (final item in items) {
    final List<String> bagian = item.trim().split('x');

    if (bagian.length != 2) {
      print('Format salah: $item');
      continue; // lompat ke item berikutnya
    }

    // bagian[0] = kode, bagian[1] = jumlah (masih String)
    final int? jumlah = int.tryParse(bagian[1]);

    final produk = katalog[bagian[0]];

    if (produk == null) {
      print('Ditolak: kode ${bagian[0]} tidak ada');
      continue;
    }
    if (jumlah == null || jumlah <= 0) {
      print('Ditolak: jumlah ${bagian[1]} tidak valid');
      continue;
    }

    print('${produk.nama} x$jumlah');
  }
}
