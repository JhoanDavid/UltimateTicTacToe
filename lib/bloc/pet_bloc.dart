import 'dart:async';

import 'package:ultimate_tic_tac_toe/Model/pet_model.dart';
import 'package:ultimate_tic_tac_toe/repository/general_repository.dart';
import 'package:ultimate_tic_tac_toe/utils/apiresponse_model.dart';
import 'package:ultimate_tic_tac_toe/resource/constants.dart';

class PetBloc {
  final _repository = GeneralRepository();
  var apiresponse = ApiResponse();
  final _petController = StreamController<Pet>.broadcast();
  final _petListController = StreamController<List<Pet>>.broadcast();
  Future<ApiResponse> createPet(Pet pet) async {
    ApiResponse apiResponse = await _repository.insertPet(pet);
    if (apiResponse.statusResponse == 200) {
      apiResponse.message = Constants.insertSuccess;
    }
    return apiResponse;
  }

  Future<ApiResponse> updatePet(Pet pet) async {
    ApiResponse apiResponse = await _repository.updatePet(pet);
    if (apiResponse.statusResponse == 200) {
      apiResponse.message = Constants.updateSuccess;
    }
    return apiResponse;
  }

  Future<ApiResponse> deletePet(int id) async {
    ApiResponse apiResponse = await _repository.deletePet(id);
    if (apiResponse.statusResponse == 200) {
      apiResponse.message = Constants.deleteSuccess;
    }
    return apiResponse;
  }

  Future<ApiResponse> getAllPet() async {
    ApiResponse apiResponse = await _repository.getAllPet();
    if (apiResponse.statusResponse == 200) {
      List<Pet> _petList = apiResponse.object;
      _petListController.add(_petList);
    }
    return apiResponse;
  }

  Future<ApiResponse> getPetById(int id) async {
    ApiResponse apiResponse = await _repository.getPetById(id);
    if (apiResponse.statusResponse == 200) {
      Pet _pet = apiResponse.object;
      _petController.add(_pet);
    }
    return apiResponse;
  }

  @override
  void dispose() {
    _petController.close();
    _petListController.close();
  }

  /* 
  //filtro por nombre
  Future<ApiResponse> getPetByName(String name) async {
    ApiResponse apiResponse = await _repository.getPetByName(name);
    return apiResponse;
  }*/
}
