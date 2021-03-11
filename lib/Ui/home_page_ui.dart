import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ultimate_tic_tac_toe/widget/background_widget.dart';
import 'package:ultimate_tic_tac_toe/widget/button_methods_game_widget.dart';
import 'package:ultimate_tic_tac_toe/widget/name_ultimate_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Stack(children: <Widget>[
      BackgroundWidget(),
      Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TicTacToeUltimate(
              sizeX: 140,
              sizeO: 108,
              sizeTicTacToe: 55,
              sizeUltimate: 45,
            ),
            MethodsGame(),
          ])
    ])));
  }
}
