import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TicTacToeUltimate extends StatelessWidget {
  double sizeX, sizeO, sizeUltimate, sizeTicTacToe;
  TicTacToeUltimate(
      {Key key,
      @required this.sizeX,
      @required this.sizeO,
      @required this.sizeUltimate,
      @required this.sizeTicTacToe})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Icon(
                      Icons.radio_button_unchecked,
                      size: sizeO,
                      color: Colors.amber[300],
                    ),
                    Icon(
                      Icons.close,
                      size: sizeX,
                      color: Colors.blue[800],
                    ),
                    Icon(
                      Icons.radio_button_unchecked,
                      size: sizeO,
                      color: Colors.amber[300],
                    )
                  ],
                ),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('ULTIMATE',
                        style: GoogleFonts.teko(
                            fontSize: sizeUltimate,
                            fontWeight: FontWeight.w700,
                            color: Colors.black87))
                  ]),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('TIC',
                        style: GoogleFonts.bungeeOutline(
                            fontSize: sizeTicTacToe,
                            fontWeight: FontWeight.w700,
                            color: Colors.black87)),
                    Text('TAC',
                        style: GoogleFonts.bungee(
                            fontSize: sizeTicTacToe, color: Colors.black87)),
                    Text('TOE',
                        style: GoogleFonts.bungeeOutline(
                            fontSize: sizeTicTacToe,
                            fontWeight: FontWeight.w700,
                            color: Colors.black87))
                  ],
                ),
              )
            ]))
      ],
    );
  }
}
