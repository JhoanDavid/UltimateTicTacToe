import 'package:flutter/material.dart';
import 'package:ultimate_tic_tac_toe/bloc/pet_bloc.dart';
import 'package:ultimate_tic_tac_toe/Model/pet_model.dart';

class PetsTestPage extends StatefulWidget {
  PetsTestPage({Key key}) : super(key: key);
  @override
  _PetsTestPageState createState() => _PetsTestPageState();
}

class _PetsTestPageState extends State<PetsTestPage> {
  PetBloc petBloc;

  @override
  void initState() {
    super.initState();
    petBloc = PetBloc();
    _loadPets();
  }

  void _loadPets() async {
    // ignore: avoid_print
    await petBloc.getAllPet().then((value) => print(value.object.toString()));
  }

  ListView _petListView(List<Pet> pets) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemBuilder: (context, index) {
        return Container(
            child: Column(
          children: [
            ListTile(
              title: Text(pets[index].name + ' ' + pets[index].idDuenio),
              subtitle: Text(pets[index].breed),
              leading: Icon(Icons.pets),
            ),
            Divider(),
          ],
        ));
      },
      itemCount: pets.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            alignment: Alignment.topCenter,
            width: 500,
            child: Text(
              'LISTA DE MASCOTAS',
            ),
          ),
          StreamBuilder<List<Pet>>(
              initialData: [],
              stream: petBloc.petList,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return _petListView(snapshot.data);
                } else {
                  return null;
                }
              })
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
