import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ultimate_tic_tac_toe/model/Game_model.dart';
import 'package:ultimate_tic_tac_toe/Model/Board_model.dart';
import 'package:ultimate_tic_tac_toe/resource/constants.dart';
import 'package:ultimate_tic_tac_toe/ui/name_players_ui.dart';
import 'package:ultimate_tic_tac_toe/widget/back_button_widget.dart';
import 'package:ultimate_tic_tac_toe/widget/background_widget.dart';
import 'package:ultimate_tic_tac_toe/widget/name_ultimate_widget.dart';

class RoundsPage extends StatefulWidget {
  @override
  _RoundsPageState createState() => _RoundsPageState();
}

class _RoundsPageState extends State<RoundsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: <Widget>[
      BackgroundWidget(),
      Container(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              TicTacToeUltimate(
                sizeX: 140,
                sizeO: 108,
                sizeTicTacToe: 55,
                sizeUltimate: 45,
              ),
              Text(Constants.selectRound,
                  style: GoogleFonts.teko(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.black87,
                    height: 1.5,
                  )),
              ElevatedButton(
                child: Container(
                    height: (MediaQuery.of(context).size.height * 0.08),
                    width: (MediaQuery.of(context).size.width * 0.70),
                    child: Center(
                      child: RichText(
                        text: TextSpan(
                            style: Theme.of(context).textTheme.bodyText1,
                            children: [
                              TextSpan(
                                  text: Constants.twoOfThree,
                                  style: GoogleFonts.bungee(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black87,
                                    height: 1.5,
                                  ))
                            ]),
                      ),
                    )),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => NamePlayerPage(
                          game: Game(
                              board: Board(
                                  board: ['', '', '', '', '', '', '', '', '']),
                              actualRound: 1,
                              roundsNum: 3,
                              move: 0))));
                },
              ),
              ElevatedButton(
                child: Container(
                    height: (MediaQuery.of(context).size.height * 0.08),
                    width: (MediaQuery.of(context).size.width * 0.70),
                    child: Center(
                      child: RichText(
                        text: TextSpan(
                            style: Theme.of(context).textTheme.bodyText1,
                            children: [
                              TextSpan(
                                  text: Constants.threeOfFive,
                                  style: GoogleFonts.bungee(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black87,
                                    height: 1.5,
                                  ))
                            ]),
                      ),
                    )),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => NamePlayerPage(
                          game: Game(
                              board: Board(
                                  board: ['', '', '', '', '', '', '', '', '']),
                              actualRound: 1,
                              roundsNum: 5,
                              move: 0))));
                },
              ),
              ElevatedButton(
                child: Container(
                    height: (MediaQuery.of(context).size.height * 0.08),
                    width: (MediaQuery.of(context).size.width * 0.70),
                    child: Center(
                      child: RichText(
                        text: TextSpan(
                            style: Theme.of(context).textTheme.bodyText1,
                            children: [
                              TextSpan(
                                  text: Constants.fourOfSeven,
                                  style: GoogleFonts.bungee(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black87,
                                    height: 1.5,
                                  ))
                            ]),
                      ),
                    )),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => NamePlayerPage(
                          game: Game(
                              board: Board(
                                  board: ['', '', '', '', '', '', '', '', '']),
                              actualRound: 1,
                              roundsNum: 7,
                              move: 0))));
                },
              )
            ],
          ),
        ),
      ),
      Positioned(top: 15, left: 0, child: BackButtonWidget())
    ]));
  }
}
