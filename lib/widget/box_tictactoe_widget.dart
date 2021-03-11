import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ultimate_tic_tac_toe/bloc/Game_bloc.dart';
import 'package:ultimate_tic_tac_toe/model/Game_model.dart';
import 'package:ultimate_tic_tac_toe/ui/game_page_ui.dart';

class BoxContainer extends StatelessWidget {
  final Game game;
  BoxContainer({Key key, @required this.game}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300,
        height: 300,
        decoration: BoxDecoration(
            color: Colors.white,
            border: new Border.all(color: Colors.blue),
            boxShadow: [
              BoxShadow(
                  color: Colors.black87,
                  blurRadius: 20.0,
                  spreadRadius: 5.0,
                  offset: Offset(7.0, 7.0))
            ]),
        child: Center(
            child: GridView.count(
          primary: true,
          crossAxisCount: 3,
          children: List.generate(9, (index) {
            return Box(index, game);
          }),
        )));
  }
}

class Box extends StatefulWidget {
  final int index;
  final Game game;
  Box(this.index, this.game);

  @override
  _BoxState createState() => _BoxState();
}

class _BoxState extends State<Box> {
  GameBloc _gameBloc;

  @override
  void initState() {
    _gameBloc = GameBloc();
    super.initState();
  }

  Future showDialogWinner(BuildContext context, String name, Game game) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text("GANA EL JUEGO: " + name,
              style: GoogleFonts.bungee(
                fontSize: 25,
                fontWeight: FontWeight.w400,
                color: Colors.black87,
                height: 1.5,
              )),
          actions: <Widget>[
            ElevatedButton(
              child: Container(
                  height: (MediaQuery.of(context).size.height * 0.08),
                  width: (MediaQuery.of(context).size.width * 0.30),
                  child: Center(
                    child: RichText(
                      text: TextSpan(
                          style: Theme.of(context).textTheme.bodyText1,
                          children: [
                            TextSpan(
                                text: "Siguiente ronda",
                                style: GoogleFonts.bungee(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black87,
                                  height: 1.5,
                                ))
                          ]),
                    ),
                  )),
              onPressed: () {
                setState(() {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => GamePage(game: game)));
                });
              },
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(context) {
    _gameBloc.createGame(widget.game);

    return MaterialButton(
        padding: EdgeInsets.all(0),
        child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                border: new Border.all(color: Colors.blueGrey)),
            child: Center(
              child: Text(
                widget.game.board.board[widget.index].toUpperCase(),
                style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )),
        onPressed: () {
          setState(() {
            if (widget.game.move % 2 == 0) {
              _gameBloc.insertValue(widget.index, widget.game, 1);
              if (_gameBloc.possibleWinRound(widget.game.board, 'X')) {
                _gameBloc.verifyRoundWin(widget.game);
                showDialogWinner(
                    context, widget.game.player1.name, widget.game);
              }
            } else if (widget.game.move % 2 == 1) {
              _gameBloc.insertValue(widget.index, widget.game, 2);
              if (_gameBloc.possibleWinRound(widget.game.board, 'O')) {
                _gameBloc.verifyRoundWin(widget.game);
                showDialogWinner(
                    context, widget.game.player2.name, widget.game);
              }
            }
          });
        });
  }
}
