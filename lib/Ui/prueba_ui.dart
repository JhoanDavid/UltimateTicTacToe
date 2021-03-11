import 'package:flutter/material.dart';
import 'package:ultimate_tic_tac_toe/Bloc/Game_bloc.dart';
import 'package:ultimate_tic_tac_toe/Model/Board_model.dart';
import 'package:ultimate_tic_tac_toe/model/Game_model.dart';
import 'package:ultimate_tic_tac_toe/Model/Player_model.dart';

class Prueba extends StatefulWidget {
  @override
  _PruebaState createState() => _PruebaState();
}

class _PruebaState extends State<Prueba> {
  GameBloc gameBloc;

  Game game = Game(
      player1: Player(name: 'Oscar', number: 1, score: 0),
      player2: Player(name: 'Alberto', number: 2, score: 0),
      board: Board(board: ['', '', '', '', '', '', '', '', '']),
      actualRound: 1,
      roundsNum: 5,
      move: 0);
  @override
  void initState() {
    gameBloc = GameBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    gameBloc.createGame(game);
    return Container(
      child: Text('Prueba'),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
