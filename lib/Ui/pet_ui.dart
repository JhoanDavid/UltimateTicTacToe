import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ultimate_tic_tac_toe/Bloc/pet_bloc.dart';
import 'package:ultimate_tic_tac_toe/Model/pet_model.dart';
import 'package:ultimate_tic_tac_toe/utils/apiresponse_model.dart';
import 'package:ultimate_tic_tac_toe/widget/background_widget.dart';
import 'package:ultimate_tic_tac_toe/widget/button_blue_widget.dart';
import 'package:ultimate_tic_tac_toe/widget/title_widget.dart';

import 'home_ui.dart';

class PetRegister extends StatefulWidget {
  PetRegister({Key key}) : super(key: key);

  @override
  _PetRegisterState createState() => _PetRegisterState();
}

class _PetRegisterState extends State<PetRegister> {
  String texto;
  final GlobalKey<FormState> _formRegister = GlobalKey<FormState>();

  PetBloc petBloc;
  String _sex;
  List<String> _list = [];

  Pet pet = Pet(
      id: null,
      name: '',
      breed: '',
      sex: '',
      idDuenio: '',
      age: 0,
      creationDate: new DateTime.now(),
      state: true);

  void _selection(String selectType) {
    setState(() {
      _sex = selectType;
      String _type;
      if (_sex == 'Macho') {
        _type = 'Macho';
        _list = ['Macho', 'Hembra'];
        pet.sex = _type;
      }
      if (_sex == 'Hembra') {
        _type = 'Hembra';
        _list = ['Hembra', 'Macho'];
        pet.sex = _type;
      }

      _sex = _type;
    });
  }

  @override
  void initState() {
    super.initState();
    lista();
    petBloc = PetBloc();
  }

  List<String> lista() {
    _list = ['Macho', 'Hembra'];
    return _list;
  }

  Widget _entryField(String title) {
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
                  border: Border.all(width: 1.5, color: Colors.black87)),
              child: TextFormField(
                onSaved: (value) {
                  setPet(value, title);
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(18))),
                    focusedBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(19))),
                    fillColor: Colors.white,
                    filled: true),
              ))
        ],
      ),
    );
  }

  void setPet(String value, String title) {
    if (title == 'Nombre') pet.name = value;
    if (title == 'Raza') pet.breed = value;
    if (title == 'Sexo') pet.sex = value;
    if (title == 'Dueño') pet.idDuenio = value;
    if (title == 'Edad') pet.age = int.parse(value);
  }

  Widget _registryBody() {
    return Form(
      key: _formRegister,
      child: Column(
        children: <Widget>[
          _entryField('Nombre'),
          _entryField('Raza'),
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
                      value: _list[0],
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(color: Colors.black87),
                      underline: Container(
                        height: 2,
                        color: Colors.blueGrey[700],
                      ),
                      onChanged: (value) {
                        _sex = value;
                      },
                      items:
                          _list.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          onTap: () {
                            _selection(value);
                          },
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
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
          _entryField('Dueño'),
          _entryField('Edad')
        ],
      ),
    );
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

  void submit() {
    final formRegister = _formRegister.currentState;
    if (formRegister.validate()) {
      formRegister.save();
      pet.state = false;
      petBloc.createPet(pet).then((ApiResponse resp) {
        if (resp.statusResponse == 200) {
          Pet petPrueba = resp.object;
          Navigator.of(context).push(_goHomeTransition());
        }
      });
    }
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
                    SizedBox(
                      height: 50,
                    ),
                    _registryBody(),
                    SizedBox(
                      height: 20,
                    ),
                    ButtonBlue(
                      onTap: submit,
                      texto: 'Registrar mascota',
                    ),
                    SizedBox(height: height * .14)
                  ],
                ),
              ),
            ),
            Positioned(top: 40, left: 0, child: _backButton()),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    petBloc.dispose();
  }
}
