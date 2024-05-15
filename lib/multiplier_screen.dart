import 'package:flutter/material.dart';
import 'multiplier_screen1.dart';

class MatrixMultiplyScreen extends StatefulWidget {
  const MatrixMultiplyScreen({super.key});

  @override

  // ignore: library_private_types_in_public_api
  _MatrixMultiplyScreenState createState() => _MatrixMultiplyScreenState();
}

class _MatrixMultiplyScreenState extends State<MatrixMultiplyScreen> {
  int s11 = 0;
  int s12 = 0;
  int s21 = 0;
  int s22 = 0;
  int t11 = 0;
  int t12 = 0;
  int t21 = 0;
  int t22 = 0;
  int p11 = 0;
  int p12 = 0;
  int p21 = 0;
  int p22 = 0;

  void updateS(int row, int col) {
    setState(() {
      if (row == 0 && col == 0) {
        s11 = (s11 + 1) % 10;
      } else if (row == 0 && col == 1) {
        s12 = (s12 + 1) % 10;
      } else if (row == 1 && col == 0) {
        s21 = (s21 + 1) % 10;
      } else if (row == 1 && col == 1) {
        s22 = (s22 + 1) % 10;
      }
    });
  }

  void updateT(int row, int col) {
    setState(() {
      if (row == 0 && col == 0) {
        t11 = (t11 + 1) % 10;
      } else if (row == 0 && col == 1) {
        t12 = (t12 + 1) % 10;
      } else if (row == 1 && col == 0) {
        t21 = (t21 + 1) % 10;
      } else if (row == 1 && col == 1) {
        t22 = (t22 + 1) % 10;
      }
    });
  }

  void _multiplyMatrix() {
    setState(() {
      p11 = s11 * s21 + t11 * s22;
      p12 = s11 * t21 + t11 * t22;
      p21 = s12 * s12 + t12 * s22;
      p22 = s12 * t21 + t12 * t22;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: const Center(
            child: Text('M A T R I X    M U L T I P L I E R',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                ))),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    _buildMatrixCell(s11, 0, 0, updateS),
                    _buildMatrixCell(s12, 0, 1, updateS),
                  ],
                ),
                const SizedBox(width: 0.3),
                Column(
                  children: [
                    _buildMatrixCell(t11, 0, 0, updateT),
                    _buildMatrixCell(t12, 0, 1, updateT),
                  ],
                ),
                const SizedBox(width: 20),
                const Column(
                  children: [
                    Text("X", style: TextStyle(fontSize: 30)),
                  ],
                ),
                const SizedBox(width: 20),
                Column(
                  children: [
                    _buildMatrixCell(s21, 1, 0, updateS),
                    _buildMatrixCell(s22, 1, 1, updateS),
                  ],
                ),
                const SizedBox(width: 0.3),
                Column(
                  children: [
                    _buildMatrixCell(t21, 1, 0, updateT),
                    _buildMatrixCell(t22, 1, 1, updateT),
                  ],
                ),
                const SizedBox(width: 20),
              ],
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    _buildResultMatrixCell(p11),
                    _buildResultMatrixCell(p21),
                  ],
                ),
                const SizedBox(width: 0.3),
                Column(
                  children: [
                    _buildResultMatrixCell(p12),
                    _buildResultMatrixCell(p22),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _multiplyMatrix();
                });
              },
              child: const Padding(
                padding: EdgeInsets.all(9.0),
                child: Text(
                  "Multiply Matrices",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const MatrixMultiplier1(),
                  ),
                );
              },
              child: const Padding(
                padding: EdgeInsets.all(9.0),
                child: Text(
                  'Tap for 3x3 matrix',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMatrixCell(
      int value, int row, int col, Function(int, int) onPressed) {
    return GestureDetector(
      onTap: () => onPressed(row, col),
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(),
        ),
        child: Center(
          child: Text(
            value.toString(),
            style: const TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }

  Widget _buildResultMatrixCell(int value) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        border: Border.all(),
      ),
      child: Center(
        child: Text(
          value.toString(),
          style: const TextStyle(fontSize: 35),
        ),
      ),
    );
  }
}
