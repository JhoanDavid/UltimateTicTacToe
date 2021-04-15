import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ultimate_tic_tac_toe/bloc/pet_bloc.dart';
import 'package:ultimate_tic_tac_toe/ui/Pet/insert_pet_ui.dart';
import 'package:ultimate_tic_tac_toe/ui/Pet/list_pet_ui.dart';
import 'package:ultimate_tic_tac_toe/widget/background_widget.dart';

class HomePetPage extends StatefulWidget {
  HomePetPage({Key key}) : super(key: key);
  @override
  _HomePetPageState createState() => _HomePetPageState();
}

class _HomePetPageState extends State<HomePetPage> {
  PetBloc petBloc;

  @override
  void initState() {
    petBloc = PetBloc();
    super.initState();
  }

  Widget _divider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 5,
              ),
            ),
          ),
          Text(
            'O',
            style: TextStyle(color: Colors.black38),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 5,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(alignment: Alignment.topCenter, children: [
        BackgroundWidget(),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).size.height * 0.15),
            Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width * 0.32,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    border: Border.all(width: 8, color: Colors.black45),
                    image: DecorationImage(
                      image: AssetImage('assets/img/logo.png'),
                      fit: BoxFit.fill,
                    ))),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.fromLTRB(
                  10,
                  MediaQuery.of(context).size.width * 0.20,
                  10,
                  MediaQuery.of(context).size.width * 0.05),
              child: ElevatedButton.icon(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green[300]),
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.fromLTRB(
                            MediaQuery.of(context).size.width * 0.10,
                            10,
                            MediaQuery.of(context).size.width * 0.10,
                            10))),
                label: Text('CREAR MASCOTA',
                    style: GoogleFonts.montserrat(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                      height: 1.5,
                    )),
                icon: Icon(Icons.pets_outlined),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return InsertPetPage();
                  }));
                },
              ),
            ),
            Expanded(child: _divider()),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.fromLTRB(
                  10,
                  MediaQuery.of(context).size.width * 0.20,
                  10,
                  MediaQuery.of(context).size.width * 0.05),
              child: ElevatedButton.icon(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue[300]),
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.fromLTRB(
                            MediaQuery.of(context).size.width * 0.10,
                            10,
                            MediaQuery.of(context).size.width * 0.10,
                            10))),
                label: Text('LISTAR MASCOTAS',
                    style: GoogleFonts.montserrat(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                      height: 1.5,
                    )),
                icon: Icon(Icons.list),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return ListPetPage();
                  }));
                },
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.15)
          ],
        )
      ]),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
