import 'package:flutter/material.dart';
import 'screens/home_page.dart';

void main() {
  runApp(const LocadoraApp());
}

class LocadoraApp extends StatelessWidget {
  const LocadoraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Locadora de Filmes',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const HomePage(),
    );
  }
}
