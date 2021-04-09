import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ultimate_tic_tac_toe/ui/pets_test_ui.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tic Tac Toe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PetsTestPage(),
    );
  }
}
