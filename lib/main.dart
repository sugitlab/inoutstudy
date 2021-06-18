import 'package:flutter/material.dart';
import './views/top_summary.dart';

void main() {
  runApp(const InOutStudy());
}

class InOutStudy extends StatelessWidget {
  const InOutStudy({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'INOUT',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: const TopSummary(),
    );
  }
}
