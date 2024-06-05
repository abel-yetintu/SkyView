import 'package:flutter/material.dart';
import 'package:sky_view/pages/home%20page/home.dart';

void main() {
  runApp(const SkyView());
}

class SkyView extends StatelessWidget {
  const SkyView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Montserrat'),
      home: const Home(),
    );
  }
}
