import 'package:flutter/material.dart';
import 'package:kuismobile_1/halaman_utama.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: const HalamanUtama(),
      debugShowCheckedModeBanner: false,
    );
  }
}
