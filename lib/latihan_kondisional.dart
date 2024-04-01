import 'package:flutter/material.dart';

class LatihanKondisional extends StatefulWidget {
  const LatihanKondisional({super.key});

  @override
  State<LatihanKondisional> createState() => _LatihanKondisionalState();
}

class _LatihanKondisionalState extends State<LatihanKondisional> {
  TextEditingController conKodeBarang = TextEditingController();
  TextEditingController conJumlahBarang = TextEditingController();
  TextEditingController conCaraBeli = TextEditingController();

  String namaBarang = '';
  double hargaBarang = 0, totalHarga = 0, diskon = 0, totalBayar = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        leading: const Icon(
          Icons.developer_board,
        ),
        title: const Center(
          child: Text(
            'LATIHAN KONDISIONAL',
            style: TextStyle(
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(
              Icons.search,
              size: 24.0,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 6,
          right: 6,
          top: 20,
        ),
        child: Wrap(
          runSpacing: 20,
          children: [
            TextField(
              controller: conKodeBarang,
              decoration: const InputDecoration(
                label: Text('Kode Barang'),
                border: OutlineInputBorder(),
              ),
            ),
            TextField(
              controller: conJumlahBarang,
              decoration: const InputDecoration(
                label: Text('Jumlah Barang'),
                border: OutlineInputBorder(),
              ),
            ),
            TextField(
              controller: conCaraBeli,
              decoration: const InputDecoration(
                label: Text('Cara Beli'),
                border: OutlineInputBorder(),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 120.0,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        switch (conKodeBarang.text.toUpperCase()) {
                          case 'SPT':
                            namaBarang = 'Sepatu';
                            hargaBarang = 200000;
                            break;
                          case 'SND':
                            namaBarang = 'Sandal';
                            hargaBarang = 100000;
                            break;
                          case 'TST':
                            namaBarang = 'T-Shrit';
                            hargaBarang = 250000;
                            break;
                          case 'TOP':
                            namaBarang = 'Topi Cowboy';
                            hargaBarang = 50000;
                            break;
                          default:
                            namaBarang = '-';
                            hargaBarang = 0;
                            break;
                        }
                        totalHarga =
                            hargaBarang * double.parse(conJumlahBarang.text);
                        if (conCaraBeli.text.toUpperCase() == 'T') {
                          diskon = 10 / 100 * totalHarga;
                        } else {
                          diskon = 0;
                        }
                        totalBayar = totalHarga - diskon;
                      });
                    },
                    child: const Text('Proses'),
                  ),
                ),
                SizedBox(
                  width: 120,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        conKodeBarang.text = '';
                        conJumlahBarang.text = '';
                        conCaraBeli.text = '';
                        namaBarang = '';
                        hargaBarang = 0;
                        totalHarga = 0;
                        diskon = 0;
                        totalBayar = 0;
                      });
                    },
                    child: const Text('Kosongkan'),
                  ),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Nama Barang : $namaBarang'),
                Text('Harga Barang : $hargaBarang'),
                Text('Total Harga : $totalHarga'),
                Text('Diskon : $diskon'),
                Text('Total Bayar : $totalBayar'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
