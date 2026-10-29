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

  final Set<String> kategoriDibeli = <String>{};
  // satu baris untuk tiap produk
  for (final e in katalog.entries) {
    final kode = e.key;
    final nama = e.value.nama;
    final harga = e.value.harga;
    print(
      '${kode.padRight(6)}${nama.padRight(24)}${harga.toString().padLeft(12)}',
    );
  }

  stdout.write('Pesanan : ');
  final String input = stdin.readLineSync() ?? '';
  final List<({String nama, int harga, int jumlah})> pesanan = [];
  final List<String> items = input.split(',');

  final List<String> ditolak = [];

  for (final item in items) {
    final List<String> bagian = item.trim().split('x');

    if (bagian.length != 2) {
      ditolak.add('Format salah $item');
      continue; // lompat ke item berikutnya
    }

    // bagian[0] = kode, bagian[1] = jumlah (masih String)
    final int? jumlah = int.tryParse(bagian[1]);

    final produk = katalog[bagian[0]];

    if (produk == null) {
      ditolak.add('kode ${bagian[0]} tidak ada \n');
      continue;
    }
    if (jumlah == null || jumlah <= 0) {
      ditolak.add('jumlah ${bagian[1]} tidak valid');
      continue;
    }
    pesanan.add((nama: produk.nama, harga: produk.harga, jumlah: jumlah));
    kategoriDibeli.add(produk.kategori);
  }

  final List<int> subtotal = pesanan.map((p) => p.harga * p.jumlah).toList();
  final int total = subtotal.fold<int>(0, (sum, s) => sum + s);
  final int diskon = total >= 100000 ? total ~/ 10 : 0;
  final int bayar = total - diskon;

  print('STRUK BELANJA');
  print('-' * 42);
  for (final p in pesanan) {
    final int sub = p.harga * p.jumlah;
    print(
      '${p.nama.padRight(24)}${'x${p.jumlah}'.padRight(6)}${sub.toString().padLeft(12)}',
    );
  }
  print('-' * 42);

  print('Total  : $total');
  print('Diskon : $diskon');
  print('Bayar  : $bayar');
  print('Kategori dibeli : ${kategoriDibeli.join(', ')}');
  if (ditolak.isNotEmpty) {
    print('Item ditolak    : ${ditolak.join('; ')}');
  }
}
