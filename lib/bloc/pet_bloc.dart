import 'package:ultimate_tic_tac_toe/Model/pet_model.dart';
import 'package:ultimate_tic_tac_toe/repository/general_repository.dart';
import 'package:ultimate_tic_tac_toe/utils/apiresponse_model.dart';

class PetBloc {
  final _repository = GeneralRepository();
  var apiresponse = ApiResponse();

  Future<ApiResponse> createPet(Pet pet) async {
    ApiResponse apiResponse = await _repository.insertPet(pet);
    return apiResponse;
  }

  Future<ApiResponse> updatePet(Pet pet) async {
    ApiResponse apiResponse = await _repository.updatePet(pet);
    return apiResponse;
  }

  Future<ApiResponse> deletePet(int id) async {
    ApiResponse apiResponse = await _repository.deletePet(id);
    return apiResponse;
  }

  Future<ApiResponse> getAllPet() async {
    ApiResponse apiResponse = await _repository.getAllPet();
    return apiResponse;
  }

  Future<ApiResponse> getPetById(int id) async {
    ApiResponse apiResponse = await _repository.getPetById(id);
    return apiResponse;
  }

  Future<ApiResponse> getPetByName(String name) async {
    ApiResponse apiResponse = await _repository.getPetByName(name);
    return apiResponse;
  }
}
