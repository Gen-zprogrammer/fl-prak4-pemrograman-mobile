import 'package:flutter/material.dart';
import 'package:pmo_praktikum4/latihan_kondisional.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LatihanKondisional(),
    );
  }
}
