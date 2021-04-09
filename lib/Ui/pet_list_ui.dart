import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ultimate_tic_tac_toe/Model/pet_model.dart';
import 'package:ultimate_tic_tac_toe/bloc/pet_bloc.dart';
import 'package:ultimate_tic_tac_toe/utils/apiresponse_model.dart';
import 'package:ultimate_tic_tac_toe/widget/background_widget.dart';
import 'package:ultimate_tic_tac_toe/widget/list_Box_widget.dart';

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

  void getPets() {
    petBloc.getAllPet().then((ApiResponse resp) {
      if (resp.statusResponse == 200) {
        petList = resp.object;
        print(petList);
      } else {
        print(resp);
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
              return (ListBox(pet: pet));
            })
      ]),
    ));
  }
}
