import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ultimate_tic_tac_toe/bloc/pet_bloc.dart';
import 'package:ultimate_tic_tac_toe/Model/pet_model.dart';
import 'package:ultimate_tic_tac_toe/ui/Pet/edit_pet_ui.dart';
import 'package:ultimate_tic_tac_toe/ui/Pet/home_pet_ui.dart';
import 'package:ultimate_tic_tac_toe/ui/Pet/view_pet_ui.dart';
import 'package:ultimate_tic_tac_toe/utils/apiresponse_model.dart';
import 'package:ultimate_tic_tac_toe/widget/background_widget.dart';
import 'package:ultimate_tic_tac_toe/widget/loader_animation_widget.dart';

class ListPetPage extends StatefulWidget {
  ListPetPage({Key key}) : super(key: key);

  @override
  _ListPetPageState createState() => _ListPetPageState();
}

class _ListPetPageState extends State<ListPetPage> {
  TextEditingController searchController = TextEditingController();
  PetBloc petBloc;
  bool loader = true;
  List<Pet> petL = [];

  @override
  void initState() {
    petBloc = PetBloc();
    _loadPets();
    super.initState();
  }

  void _loadPets() async {
    await petBloc.getAllPet().then((value) => {petL = value.object});
  }

  // ignore: missing_return
  Widget loaderWidget() {
    while (loader) {
      return ColorLoader(
        duration: Duration(seconds: 5),
        colors: [
          Colors.blue[200],
          Colors.blue[400],
          Colors.blue,
          Colors.blue[700],
          Colors.blue[900]
        ],
      );
    }
  }

  Future showDialogSuccess(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text('Se eliminó correctamente la mascota',
              style: GoogleFonts.happyMonkey(
                fontSize: 25,
                fontWeight: FontWeight.w400,
                color: Colors.black87,
                height: 1.5,
              )),
          actions: <Widget>[
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.green[600])),
              child: Container(
                  height: (MediaQuery.of(context).size.height * 0.08),
                  width: (MediaQuery.of(context).size.width * 0.30),
                  child: Center(
                    child: RichText(
                      text: TextSpan(
                          style: Theme.of(context).textTheme.bodyText1,
                          children: [
                            TextSpan(
                                text: 'Ok',
                                style: GoogleFonts.happyMonkey(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black87,
                                  height: 1.5,
                                ))
                          ]),
                    ),
                  )),
              onPressed: () {
                _loadPets();
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }

  Future showDialogConfirmation(BuildContext context, int id) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text('¿Está seguro de eliminar esta mascota? ',
              style: GoogleFonts.happyMonkey(
                fontSize: 25,
                fontWeight: FontWeight.w400,
                color: Colors.black87,
                height: 1.5,
              )),
          actions: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red[600])),
                  child: Container(
                      height: (MediaQuery.of(context).size.height * 0.08),
                      width: (MediaQuery.of(context).size.width * 0.15),
                      child: Center(
                        child: RichText(
                          text: TextSpan(
                              style: Theme.of(context).textTheme.bodyText1,
                              children: [
                                TextSpan(
                                    text: 'Si',
                                    style: GoogleFonts.happyMonkey(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black87,
                                      height: 1.5,
                                    ))
                              ]),
                        ),
                      )),
                  onPressed: () {
                    petBloc.deletePet(id).then((ApiResponse resp) {
                      if (resp.statusResponse == 200) {
                        showDialogSuccess(context)
                            .whenComplete(() => Navigator.of(context).pop());
                      }
                    });
                  },
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.blueGrey[300])),
                  child: Container(
                      height: (MediaQuery.of(context).size.height * 0.08),
                      width: (MediaQuery.of(context).size.width * 0.15),
                      child: Center(
                        child: RichText(
                          text: TextSpan(
                              style: Theme.of(context).textTheme.bodyText1,
                              children: [
                                TextSpan(
                                    text: 'No',
                                    style: GoogleFonts.happyMonkey(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black87,
                                      height: 1.5,
                                    ))
                              ]),
                        ),
                      )),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            )
          ],
        );
      },
    );
  }

  ListView _petListView(List<Pet> pets, BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemBuilder: (context, index) {
        return Container(
            child: Column(
          children: [
            Slidable(
              actionPane: SlidableScrollActionPane(),
              actionExtentRatio: 1 / 2,
              child: ListTile(
                onTap: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return ViewPetPage(
                      pet: Pet(
                          id: pets[index].id,
                          name: pets[index].name,
                          breed: pets[index].breed,
                          sex: pets[index].sex,
                          idDuenio: pets[index].idDuenio,
                          age: pets[index].age,
                          creationDate: pets[index].creationDate,
                          state: pets[index].state));
                })),
                title: Text(pets[index].name + ' ' + pets[index].idDuenio),
                subtitle: Text(pets[index].breed),
                leading: Icon(Icons.pets),
              ),
              secondaryActions: <Widget>[
                IconSlideAction(
                  caption: 'EDITAR',
                  color: Colors.cyan[300],
                  icon: Icons.edit,
                  onTap: () => Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return EditPetPage(
                        pet: Pet(
                            id: pets[index].id,
                            name: pets[index].name,
                            breed: pets[index].breed,
                            sex: pets[index].sex,
                            idDuenio: pets[index].idDuenio,
                            age: pets[index].age,
                            creationDate: pets[index].creationDate,
                            state: pets[index].state));
                  })),
                ),
                IconSlideAction(
                  caption: 'BORRAR',
                  color: Colors.red[600],
                  icon: Icons.delete,
                  onTap: () => showDialogConfirmation(context, pets[index].id),
                )
              ],
            ),
            Divider(),
          ],
        ));
      },
      itemCount: pets.length,
    );
  }

  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => HomePetPage()),
            (Route<dynamic> route) => false);
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
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                    width: MediaQuery.of(context).size.width * 0.80,
                    child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                            labelText: 'Buscar por nombre',
                            hintText: 'Buscar por nombre',
                            prefixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25.0)))),
                        onChanged: (value) {
                          petBloc.filter(value);
                        })),
                Center(
                    child: Container(
                  padding: EdgeInsets.all(10.0),
                  margin: EdgeInsets.all(10.0),
                  alignment: Alignment.topCenter,
                  width: 500,
                  child: Text('LISTA DE MASCOTAS',
                      style: GoogleFonts.montserrat(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                        height: 1.5,
                      )),
                )),
                Container(
                    height: (MediaQuery.of(context).size.height * 0.45),
                    child: StreamBuilder<List<Pet>>(
                        initialData: [],
                        stream: petBloc.petList,
                        builder: (context, AsyncSnapshot<List<Pet>> snapshot) {
                          switch (snapshot.connectionState) {
                            case ConnectionState.waiting:
                              return loaderWidget();
                            case ConnectionState.none:
                            case ConnectionState.active:
                            case ConnectionState.done:
                              break;
                          }
                          if (snapshot.hasData) {
                            return _petListView(snapshot.data, context);
                          } else {
                            return null;
                          }
                        }))
              ]),
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
