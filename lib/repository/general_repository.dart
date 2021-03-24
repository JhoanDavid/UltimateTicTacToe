import 'package:ultimate_tic_tac_toe/Model/pet_model.dart';
import 'package:ultimate_tic_tac_toe/repository/pet_Api_Service.dart';
import 'package:ultimate_tic_tac_toe/utils/apiresponse_model.dart';

class GeneralRepository {
  final petApiService = PetApiService();

  Future<ApiResponse> getAllPet() => petApiService.getAllPet();

  Future<ApiResponse> getPetById(int id) => petApiService.getPetById(id);

  Future<ApiResponse> getPetByName(String name) =>
      petApiService.getPetByName(name);

  Future<ApiResponse> insertPet(Pet pet) => petApiService.insertPet(pet);

  Future<ApiResponse> updatePet(Pet pet) => petApiService.updatePet(pet);

  Future<ApiResponse> deletePet(int id) => petApiService.deletePet(id);
}
