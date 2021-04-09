import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ultimate_tic_tac_toe/Model/pet_model.dart';
import 'package:ultimate_tic_tac_toe/bloc/pet_bloc.dart';
import 'package:ultimate_tic_tac_toe/utils/apiresponse_model.dart';
import 'package:ultimate_tic_tac_toe/widget/background_widget.dart';
import 'package:ultimate_tic_tac_toe/widget/list_Box_widget.dart';

import 'home_ui.dart';

class PetListUI extends StatefulWidget {
  const PetListUI({Key key}) : super(key: key);

  @override
  _PetListUIState createState() => _PetListUIState();
}

class _PetListUIState extends State<PetListUI> {
  List<Pet> petList = [];
  PetBloc petBloc;
  @override
  void initState() {
    super.initState();
    getPets();
  }

  Route _goHomeTransition() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => Home(),
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

  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(_goHomeTransition());
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
            ),
            Text('Volver',
                style: GoogleFonts.montserrat(
                    textStyle: Theme.of(context).textTheme.headline4,
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    color: Colors.black87))
          ],
        ),
      ),
    );
  }

  void getPets() {
    petBloc.getAllPet().then((ApiResponse resp) {
      if (resp.statusResponse == 200) {
        petList = resp.object;
        print('petList');
      } else {
        print('resp');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Stack(children: <Widget>[
        BackgroundWidget(),
        ListView.builder(
            itemCount: petList.length,
            itemBuilder: (context, index) {
              final pet = petList[index];
              return (Stack(children: <Widget>[ListBox(pet: pet)]));
            }),
        Positioned(top: 40, left: 0, child: _backButton()),
      ]),
    ));
  }
}
