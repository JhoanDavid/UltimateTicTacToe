import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ultimate_tic_tac_toe/bloc/pet_bloc.dart';
import 'package:ultimate_tic_tac_toe/Model/pet_model.dart';
import 'package:ultimate_tic_tac_toe/ui/Pet/edit_pet_ui.dart';
import 'package:ultimate_tic_tac_toe/ui/Pet/insert_pet_ui.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:ultimate_tic_tac_toe/utils/apiresponse_model.dart';
import 'package:ultimate_tic_tac_toe/widget/background_widget.dart';
import 'package:ultimate_tic_tac_toe/widget/loader_animation_widget.dart';

class HomePetPage extends StatefulWidget {
  HomePetPage({Key key}) : super(key: key);
  @override
  _HomePetPageState createState() => _HomePetPageState();
}

class _HomePetPageState extends State<HomePetPage> {
  PetBloc petBloc;
  bool loader = true;

  @override
  void initState() {
    petBloc = PetBloc();
    _loadPets();
    super.initState();
  }

  void _loadPets() async {
    await petBloc.getAllPet().then((value) => {loaderWidget(), loader = false});
  }

  // ignore: missing_return
  Widget loaderWidget() {
    while (loader) {
      return ColorLoader(
        duration: Duration(minutes: 2),
        colors: [
          Colors.red[100],
          Colors.red[200],
          Colors.red[300],
          Colors.red[400],
          Colors.red
        ],
      );
    }
  }

  Future showDialogWinner(BuildContext context, int id) async {
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
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.red[600])),
              child: Container(
                  height: (MediaQuery.of(context).size.height * 0.08),
                  width: (MediaQuery.of(context).size.width * 0.30),
                  child: Center(
                    child: RichText(
                      text: TextSpan(
                          style: Theme.of(context).textTheme.bodyText1,
                          children: [
                            TextSpan(
                                text: 'Seguro',
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
                print(id);
                petBloc.deletePet(id).then((ApiResponse resp) {
                  print(resp.statusResponse);
                  print(resp.message);
                  if (resp.statusResponse == 200) {
                    Navigator.of(context).pop();
                  }
                });
              },
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
                  return InsertPetPage();
                })),
                title: Text(pets[index].name + ' ' + pets[index].idDuenio),
                subtitle: Text(pets[index].breed),
                leading: Icon(Icons.pets),
              ),
              secondaryActions: <Widget>[
                IconSlideAction(
                  caption: 'EDIT',
                  color: Colors.cyan[300],
                  icon: Icons.edit,
                  // ignore: avoid_print
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
                  caption: 'DELETE',
                  color: Colors.red[600],
                  icon: Icons.delete,
                  onTap: () => showDialogWinner(context, pets[index].id),
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
                thickness: 1,
              ),
            ),
          ),
          Text(
            'o',
            style: TextStyle(color: Colors.black38),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
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
                height: (MediaQuery.of(context).size.height * 0.60),
                child: StreamBuilder<List<Pet>>(
                    initialData: [],
                    stream: petBloc.petList,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return _petListView(snapshot.data, context);
                      } else {
                        return null;
                      }
                    }))
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
