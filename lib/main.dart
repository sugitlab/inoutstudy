import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import './views/top_summary.dart';

void main() {
  runApp(const ProviderScope(child: InOutStudy()));
}

class InOutStudy extends StatelessWidget {
  const InOutStudy({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'INOUT',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.indigo,
        primaryColor: Colors.indigo,
      ),
      home: const TopSummary(),
    );
  }
}
