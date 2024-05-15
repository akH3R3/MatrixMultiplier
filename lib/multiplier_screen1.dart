import 'package:flutter/material.dart';

class MatrixMultiplier1 extends StatefulWidget {
  const MatrixMultiplier1({super.key});

  @override
  State<MatrixMultiplier1> createState() => MatrixMultiplier1State();
}

class MatrixMultiplier1State extends State<MatrixMultiplier1> {
  int s11 = 0;
  int s12 = 0;
  int s13 = 0;
  int s21 = 0;
  int s22 = 0;
  int s23 = 0;
  int t11 = 0;
  int t12 = 0;
  int t13 = 0;
  int t21 = 0;
  int t22 = 0;
  int t23 = 0;
  int u11 = 0;
  int u12 = 0;
  int u13 = 0;
  int u21 = 0;
  int u22 = 0;
  int u23 = 0;
  int p11 = 0;
  int p12 = 0;
  int p13 = 0;
  int p21 = 0;
  int p22 = 0;
  int p23 = 0;
  int p31 = 0;
  int p32 = 0;
  int p33 = 0;

  void updateS(int row, int col) {
    setState(() {
      if (row == 0 && col == 0) {
        s11 = (s11 + 1) % 10;
      } else if (row == 0 && col == 1) {
        s12 = (s12 + 1) % 10;
      } else if (row == 0 && col == 2) {
        s13 = (s22 + 1) % 10;
      } else if (row == 1 && col == 0) {
        s21 = (s21 + 1) % 10;
      } else if (row == 1 && col == 1) {
        s22 = (s22 + 1) % 10;
      } else if (row == 1 && col == 2) {
        s23 = (s22 + 1) % 10;
      }
    });
  }

  void updateT(int row, int col) {
    setState(() {
      if (row == 0 && col == 0) {
        t11 = (t11 + 1) % 10;
      } else if (row == 0 && col == 1) {
        t12 = (t12 + 1) % 10;
      } else if (row == 0 && col == 2) {
        t13 = (t22 + 1) % 10;
      } else if (row == 1 && col == 0) {
        t21 = (t21 + 1) % 10;
      } else if (row == 1 && col == 1) {
        t22 = (t22 + 1) % 10;
      } else if (row == 1 && col == 2) {
        t23 = (t22 + 1) % 10;
      }
    });
  }

  void updateU(int row, int col) {
    setState(() {
      if (row == 0 && col == 0) {
        u11 = (u11 + 1) % 10;
      } else if (row == 0 && col == 1) {
        u12 = (u12 + 1) % 10;
      } else if (row == 0 && col == 2) {
        u13 = (u22 + 1) % 10;
      } else if (row == 1 && col == 0) {
        u21 = (u21 + 1) % 10;
      } else if (row == 1 && col == 1) {
        u22 = (u22 + 1) % 10;
      } else if (row == 1 && col == 2) {
        u23 = (u22 + 1) % 10;
      }
    });
  }

  void _multiplyMatrix() {
    setState(() {
      p11 = s11 * s21 + t11 * s22 + u11 * s23;
      p12 = s11 * t21 + t11 * t22 + u11 * t23;
      p13 = s11 * u21 + t11 * u22 + u11 * u23;
      p21 = s12 * s21 + t12 * s22 + u12 * s23;
      p22 = s12 * t21 + t22 * t22 + u12 * t23;
      p23 = s12 * u21 + t12 * u22 + u12 * u23;
      p31 = s13 * s21 + t13 * s22 + u13 * s23;
      p32 = s13 * t21 + t13 * t22 + u13 * t23;
      p33 = s13 * u21 + t13 * u22 + u13 * u23;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: const Center(
            child: Text('M A T R I X    M U L T I P L I E R',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ))),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    _buildMatrixCell(s11, 0, 0, updateS),
                    _buildMatrixCell(s12, 0, 1, updateS),
                    _buildMatrixCell(s13, 0, 2, updateS),
                  ],
                ),
                const SizedBox(width: 0.3),
                Column(
                  children: [
                    _buildMatrixCell(t11, 0, 0, updateT),
                    _buildMatrixCell(t12, 0, 1, updateT),
                    _buildMatrixCell(t13, 0, 2, updateT),
                  ],
                ),
                const SizedBox(width: 0.3),
                Column(
                  children: [
                    _buildMatrixCell(u11, 0, 0, updateU),
                    _buildMatrixCell(u12, 0, 1, updateU),
                    _buildMatrixCell(u13, 0, 2, updateU),
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
                    _buildMatrixCell(s23, 1, 2, updateS),
                  ],
                ),
                const SizedBox(width: 0.3),
                Column(
                  children: [
                    _buildMatrixCell(t21, 1, 0, updateT),
                    _buildMatrixCell(t22, 1, 1, updateT),
                    _buildMatrixCell(t23, 1, 2, updateT),
                  ],
                ),
                Column(
                  children: [
                    _buildMatrixCell(u21, 1, 0, updateU),
                    _buildMatrixCell(u22, 1, 1, updateU),
                    _buildMatrixCell(u23, 1, 2, updateU),
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
                    _buildResultMatrixCell(p31),
                  ],
                ),
                const SizedBox(width: 0.3),
                Column(
                  children: [
                    _buildResultMatrixCell(p12),
                    _buildResultMatrixCell(p22),
                    _buildResultMatrixCell(p32),
                  ],
                ),
                const SizedBox(width: 0.3),
                Column(
                  children: [
                    _buildResultMatrixCell(p13),
                    _buildResultMatrixCell(p23),
                    _buildResultMatrixCell(p33),
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
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "Multiply Matrices",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            const SizedBox(height: 40),
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
