import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ultimate_tic_tac_toe/Model/pet_model.dart';

class ListBox extends StatelessWidget {
  final Pet pet;
  const ListBox({Key key, this.pet}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
          color: Colors.orange,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Text(
        pet.name,
        style: GoogleFonts.portLligatSlab(
            textStyle: Theme.of(context).textTheme.headline4,
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.white),
      ),
    );
  }
}
