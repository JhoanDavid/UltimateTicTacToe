import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ultimate_tic_tac_toe/Bloc/Game_bloc.dart';
import 'package:ultimate_tic_tac_toe/Model/Board_model.dart';
import 'package:ultimate_tic_tac_toe/Model/Game_model.dart';
import 'package:ultimate_tic_tac_toe/Model/Player_model.dart';

class Prueba extends StatefulWidget {
  @override
  _PruebaState createState() => _PruebaState();
}

class _PruebaState extends State<Prueba> {
  GameBloc gameBloc;

  Board board = Board(board: ['', '', '', '', '', '', '', '', '']);
  Game game = Game(
      player1: Player(name: "Oscar", number: 1, score: 0),
      player2: Player(name: "Alberto", number: 2, score: 0),
      board: Board(board: ['', '', '', '', '', '', '', '', '']),
      actualRound: 1,
      roundsNum: 5);
  List<String> arr = ['X', '', '', 'X', 'X', 'X', '', 'X', ''];
  @override
  void initState() {
    gameBloc = GameBloc();
  }

  @override
  Widget build(BuildContext context) {
    gameBloc.createGame(game);
    print(arr);
    print(game.board.board);
    print(GameBloc().insertValue(0, game, 2).board);
    print(GameBloc().insertValue(1, game, 2).board);
    print(GameBloc().insertValue(2, game, 2).board);
    //   print(GameBloc().insertValue(4, game, 1).board);
    print(GameBloc().possibleWinRound(game.board, "O"));
    return Container(
      child: Text("Prueba"),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
