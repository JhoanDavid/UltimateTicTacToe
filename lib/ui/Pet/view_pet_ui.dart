import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ultimate_tic_tac_toe/Bloc/pet_bloc.dart';
import 'package:ultimate_tic_tac_toe/Model/pet_model.dart';
import 'package:ultimate_tic_tac_toe/widget/background_widget.dart';

class ViewPetPage extends StatefulWidget {
  final Pet pet;
  ViewPetPage({Key key, @required this.pet}) : super(key: key);
  @override
  _ViewPetPageState createState() => _ViewPetPageState();
}

class _ViewPetPageState extends State<ViewPetPage> {
  String texto;
  final GlobalKey<FormState> _formRegister = GlobalKey<FormState>();
  Pet pet;
  PetBloc petBloc;

  @override
  void initState() {
    super.initState();
    petBloc = PetBloc();
    pet = Pet(
        id: widget.pet.id,
        name: widget.pet.name,
        breed: widget.pet.breed,
        sex: widget.pet.sex,
        idDuenio: widget.pet.idDuenio,
        age: widget.pet.age,
        creationDate: widget.pet.creationDate,
        state: widget.pet.state);
  }

  Widget _field(String title, String varName) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: GoogleFonts.montserrat(
                textStyle: Theme.of(context).textTheme.headline4,
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.black87),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  border: Border.all(width: 1.5, color: Colors.black38)),
              child: Text(
                  varName == 'name'
                      ? pet.name
                      : varName == 'breed'
                          ? pet.breed
                          : varName == 'idDuenio'
                              ? pet.idDuenio
                              : varName == 'age'
                                  ? pet.age
                                  : null,
                  style: GoogleFonts.montserrat(
                      textStyle: Theme.of(context).textTheme.headline4,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87)))
        ],
      ),
    );
  }

  Widget _registryBody() {
    return Form(
      key: _formRegister,
      child: Column(
        children: <Widget>[
          _field('Nombre', 'name'),
          _field('Raza', 'breed'),
          SizedBox(
            height: 20.0,
          ),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: [
                    Text('Sexo',
                        style: GoogleFonts.montserrat(
                            textStyle: Theme.of(context).textTheme.headline4,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87)),
                    SizedBox(
                      width: 15.0,
                    ),
                    DropdownButton<String>(
                      disabledHint: Text(pet.sex,
                          style: TextStyle(color: Colors.black87)),
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(color: Colors.black87),
                      underline: Container(
                        height: 2,
                        color: Colors.blueGrey[700],
                      ),
                      items: [],
                    ),
                  ],
                ),
              ]),
          SizedBox(
            height: 20.0,
          ),
          SizedBox(
            height: 20.0,
          ),
          _field('Dueño', 'idDuenio'),
          _field('Edad', 'age')
        ],
      ),
    );
  }

  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          BackgroundWidget(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 50,
                  ),
                  _registryBody(),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
          Positioned(top: 40, left: 0, child: _backButton()),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
