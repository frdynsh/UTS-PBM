import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Widget Stateless
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Projek UTS PBM',
      home: const GambarSlider(),
    );
  }
}

// Widget Stateful
class GambarSlider extends StatefulWidget {
  const GambarSlider({super.key});

  @override
  State<GambarSlider> createState() => _GambarSliderState();
}

class _GambarSliderState extends State<GambarSlider> {
  // Daftar gambar dari assets dan internet
  final List<Map<String, String>> gambarList = [
    {
      'nama': 'Kucing',
      'tipe': 'lokal', 
      'path': 'assets/images/1.jpg'
    },
    {
      'nama': 'Tupai',
      'tipe': 'lokal',
      'path': 'assets/images/2.jpg'
    },
    {
      'nama': 'Rubah',
      'tipe': 'lokal',
      'path': 'assets/images/3.jpg'
    },
    {
      'nama': 'Kelinci',
      'tipe': 'internet',
      'path':
          'https://cdn.pixabay.com/photo/2014/06/21/08/43/rabbit-373691_1280.jpg',
    },
    {
      'nama': 'Kanguru',
      'tipe': 'internet',
      'path':
          'https://cdn.pixabay.com/photo/2021/08/19/10/47/kangaroo-6557734_1280.jpg',
    },
  ];

  int indexSekarang = 0;

  void gambarBerikutnya() {
    setState(() {
      indexSekarang = (indexSekarang + 1) % gambarList.length;
    });
  }

  void gambarSebelumnya() {
    setState(() {
      indexSekarang =
          (indexSekarang - 1 + gambarList.length) % gambarList.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final gambar = gambarList[indexSekarang];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Projek UTS PBM',
          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.2),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightGreen,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Ferdi Yansah - 2310631170084',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 40),
            
            const Text(
              'Gambar Hewan-Hewan',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Menampilkan gambar
            gambar['tipe'] == 'lokal'
                ? Image.asset(
                    gambar['path']!,
                    width: 250,
                    height: 250,
                    fit: BoxFit.cover,
                  )
                : Image.network(
                    gambar['path']!,
                    width: 250,
                    height: 250,
                    fit: BoxFit.cover,
                  ),

            const SizedBox(height: 10),

            // Menampilkan nama hewan
            Text(
              gambar['nama']!,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange,
              ),
            ),

            const SizedBox(height: 20),

            // Tombol panah
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: gambarSebelumnya,
                  icon: const Icon(Icons.arrow_back),
                ),
                IconButton(
                  onPressed: gambarBerikutnya,
                  icon: const Icon(Icons.arrow_forward),
                ),
              ],
            ),

            const SizedBox(height: 10),

            Text(
              'Gambar ke-${indexSekarang + 1} ${gambar['tipe'] == 'lokal' ? '(Lokal)' : '(Internet)'} dari ${gambarList.length}',
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}