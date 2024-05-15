import 'package:flutter/material.dart';
import 'splash_screen.dart';

void main() {
  runApp(const MatrixMultiplyApp());
}

class MatrixMultiplyApp extends StatelessWidget {
  const MatrixMultiplyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Matrix Multiplier',
      home: SplashScreen(),
    );
  }
}
