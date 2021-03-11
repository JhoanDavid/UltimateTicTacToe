import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ultimate_tic_tac_toe/model/Game_model.dart';
import 'package:ultimate_tic_tac_toe/Model/Player_model.dart';
import 'package:ultimate_tic_tac_toe/resource/constants.dart';
import 'package:ultimate_tic_tac_toe/ui/game_page_ui.dart';
import 'package:ultimate_tic_tac_toe/widget/back_button_widget.dart';
import 'package:ultimate_tic_tac_toe/widget/background_widget.dart';
import 'package:ultimate_tic_tac_toe/widget/name_ultimate_widget.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class NamePlayerPage extends StatelessWidget {
  Game game;
  bool keyboard = false;
  NamePlayerPage({Key key, @required this.game}) : super(key: key);
  final player1Controller = TextEditingController();
  final player2Controller = TextEditingController();

  final GlobalKey<FormState> _namePlayer = GlobalKey<FormState>();

  Widget _entryField(String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: GoogleFonts.bungee(
              fontSize: 25,
              fontWeight: FontWeight.w400,
              color: Colors.black87,
              height: 1.5,
            ),
          ),
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  border: Border.all(width: 1.5, color: Colors.black87)),
              child: TextFormField(
                validator: (value) =>
                    value.isEmpty ? Constants.requireData : null,
                controller: title == Constants.player1
                    ? player1Controller
                    : player2Controller,
              ))
        ],
      ),
    );
  }

  void submit(BuildContext context) {
    game.player1 = Player(name: player1Controller.text, number: 1, score: 0);
    game.player2 = Player(name: player2Controller.text, number: 2, score: 0);
    _goToGame(context);
  }

  Future<dynamic> _goToGame(BuildContext context) {
    return Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => GamePage(game: game)));
  }

  Widget _sizeChange() {
    var keyboardVisibilityController = KeyboardVisibilityController();

    keyboardVisibilityController.onChange.listen((bool visible) {
      keyboard = visible;
    });

    if (keyboard == true) {
      return TicTacToeUltimate(
        sizeX: 40,
        sizeO: 28,
        sizeTicTacToe: 20,
        sizeUltimate: 35,
      );
    } else {
      return TicTacToeUltimate(
        sizeX: 140,
        sizeO: 108,
        sizeTicTacToe: 55,
        sizeUltimate: 45,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      BackgroundWidget(),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _sizeChange(),
          Form(
            key: _namePlayer,
            child: Column(
              children: [
                _entryField(Constants.player1),
                _entryField(Constants.player2),
              ],
            ),
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
                              text: Constants.accept,
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
              submit(context);
            },
          ),
        ],
      ),
      Positioned(top: 15, left: 0, child: BackButtonWidget())
    ]));
  }
}
