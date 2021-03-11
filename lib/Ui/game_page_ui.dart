import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ultimate_tic_tac_toe/model/Game_model.dart';
import 'package:ultimate_tic_tac_toe/resource/constants.dart';
import 'package:ultimate_tic_tac_toe/ui/home_page_ui.dart';
import 'package:ultimate_tic_tac_toe/widget/background_widget.dart';
import 'package:ultimate_tic_tac_toe/widget/box_tictactoe_widget.dart';

class GamePage extends StatefulWidget {
  final Game game;
  GamePage({Key key, @required this.game}) : super(key: key);
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        BackgroundWidget(),
        Positioned(
            top: 80,
            left: 50,
            child: Row(
              children: <Widget>[
                Text(Constants.player1 + ': ' + widget.game.player1.name,
                    style: GoogleFonts.teko(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87)),
                Text(
                    ' ' +
                        widget.game.player1.score.toString() +
                        Constants.score,
                    style: GoogleFonts.bungeeOutline(
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                        color: Colors.black87))
              ],
            )),
        Positioned(
            top: 120,
            left: 50,
            child: Row(
              children: <Widget>[
                Text(Constants.player2 + ': ' + widget.game.player2.name,
                    style: GoogleFonts.teko(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87)),
                Text(
                    ' ' +
                        widget.game.player2.score.toString() +
                        Constants.score,
                    style: GoogleFonts.bungeeOutline(
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                        color: Colors.black87))
              ],
            )),
        Container(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(Constants.round + widget.game.actualRound.toString(),
                    style: GoogleFonts.bungee(
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                      color: Colors.black87,
                      height: 1.5,
                    )),
                BoxContainer(game: widget.game)
              ],
            ),
          ),
        ),
        Positioned(top: 15, left: 0, child: BackButton())
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => HomePage()));
        },
        tooltip: 'Go home',
        child: Icon(Icons.home),
      ),
    );
  }
}
