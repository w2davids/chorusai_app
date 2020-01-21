import 'package:flutter/material.dart';

import 'chorusai/views/ChorusAiHomeView.dart';

// Runs the MyApp
void main() => runApp(ChorusAiApp());

class ChorusAiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChorusAI Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChorusAiHomePage(title: 'ChorusAI Demo Home Page'),
    );
  }
}
