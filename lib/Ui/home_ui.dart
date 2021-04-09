import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ultimate_tic_tac_toe/Ui/pet_list_ui.dart';
import 'package:ultimate_tic_tac_toe/Ui/pet_ui.dart';
import 'package:ultimate_tic_tac_toe/widget/background_widget.dart';
import 'package:ultimate_tic_tac_toe/widget/button_blue_widget.dart';
import 'package:ultimate_tic_tac_toe/widget/title_widget.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Route _goPetRegister() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => PetRegister(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  Route _goPetList() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => PetListUI(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
      height: height,
      child: Stack(
        children: <Widget>[
          BackgroundWidget(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: height * .2),
                  TitleApp(),
                  SizedBox(height: 100),
                  ButtonBlue(
                    onTap: () => {Navigator.of(context).push(_goPetList())},
                    texto: 'Lista de mascotas',
                  ),
                  SizedBox(height: 100),
                  ButtonBlue(
                    onTap: () => {Navigator.of(context).push(_goPetRegister())},
                    texto: 'Registrar mascota',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
