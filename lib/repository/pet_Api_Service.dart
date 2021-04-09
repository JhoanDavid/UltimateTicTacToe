import 'dart:convert';
import 'dart:io';

import 'package:ultimate_tic_tac_toe/Model/pet_model.dart';
import 'package:http/http.dart' as http;
import 'package:ultimate_tic_tac_toe/resource/constants.dart';
import 'package:ultimate_tic_tac_toe/utils/apiresponse_model.dart';
import 'package:ultimate_tic_tac_toe/utils/errorapiresponse_model.dart';

class PetApiService {
  Pet _pet;
  ErrorApiResponse _error;

  Future<ApiResponse> getAllPet() async {
    List<Pet> listPets = [];
    ApiResponse apiResponse = ApiResponse(statusResponse: 0);
    Uri uri = Uri.http(Constants.urlAuthority, Constants.urlFindAllPets);
    var res = await http.get(uri);
    var resBody = json.decode(res.body);

    apiResponse.statusResponse = res.statusCode;

    if (apiResponse.statusResponse == 200 || res.statusCode == 200) {
      resBody.forEach((i) {
        listPets.add(Pet.fromJson(i));
        return i;
      });
      apiResponse.object = listPets;
    } else {
      _error = ErrorApiResponse.fromJson(resBody);

      apiResponse.object = _error;
    }
    return apiResponse;
  }

  Future<ApiResponse> getPetById(int id) async {
    ApiResponse apiResponse = ApiResponse(statusResponse: 0);
    var queryParameters = {'id': id.toString()};
    Uri uri = Uri.http(Constants.urlAuthority,
        Constants.pathBase + Constants.urlFindByIdPet, queryParameters);
    var res = await http.get(uri);

    var resBody = json.decode(res.body);
    apiResponse.statusResponse = res.statusCode;
    if (apiResponse.statusResponse == 200) {
      _pet = Pet.fromJson(resBody);
      apiResponse.object = _pet;
    } else {
      _error = ErrorApiResponse.fromJson(resBody);
      apiResponse.object = _error;
    }
    return apiResponse;
  }

  Future<ApiResponse> getPetByName(String name) async {
    ApiResponse apiResponse = ApiResponse(statusResponse: 0);
    var queryParameters = {'nombre': name};
    Uri uri = Uri.http(Constants.urlAuthority,
        Constants.pathBase + Constants.urlFindByNamePet, queryParameters);
    var res = await http.get(uri);

    var resBody = json.decode(res.body);
    apiResponse.statusResponse = res.statusCode;
    if (apiResponse.statusResponse == 200) {
      _pet = Pet.fromJson(resBody);
      apiResponse.object = _pet;
    } else {
      _error = ErrorApiResponse.fromJson(resBody);
      apiResponse.object = _error;
    }
    return apiResponse;
  }

  Future<ApiResponse> insertPet(Pet pet) async {
    ApiResponse apiResponse = ApiResponse(statusResponse: 0);
    var body = json.encode(pet.toJsonRegistry());
    Uri uri = Uri.http(Constants.urlAuthority, Constants.urlInsertPet);
    var res = await http.post(uri,
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        body: body);

    var resBody = json.decode(res.body);
    apiResponse.statusResponse = res.statusCode;
    if (apiResponse.statusResponse == 200 || res.statusCode == 200) {
      _pet = Pet.fromJson(resBody);
      apiResponse.object = _pet;
    } else {
      _error = ErrorApiResponse.fromJson(resBody);
      apiResponse.object = _error;
    }
    return apiResponse;
  }

  Future<ApiResponse> updatePet(Pet pet) async {
    ApiResponse apiResponse = ApiResponse(statusResponse: 0);
    var body = json.encode(pet.toJson());
    Uri uri = Uri.http(
        Constants.urlAuthority, Constants.pathBase + Constants.urlUpdatePet);
    var res = await http.put(uri,
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        body: body);

    var resBody = json.decode(res.body);
    apiResponse.statusResponse = res.statusCode;
    if (apiResponse.statusResponse == 200) {
      _pet = Pet.fromJson(resBody);
      apiResponse.object = _pet;
    } else {
      _error = ErrorApiResponse.fromJson(resBody);
      apiResponse.object = _error;
    }
    return apiResponse;
  }

  Future<ApiResponse> deletePet(int idPet) async {
    ApiResponse apiResponse = ApiResponse(statusResponse: 0);
    var queryParameters = {'id': idPet.toString()};
    Uri uri = Uri.http(Constants.urlAuthority,
        Constants.pathBase + Constants.urlDeletePet, queryParameters);
    var res = await http.delete(uri);

    var resBody = json.decode(res.body);
    apiResponse.statusResponse = res.statusCode;
    if (apiResponse.statusResponse == 200) {
      _pet = Pet.fromJson(resBody);
      apiResponse.object = _pet;
    } else {
      _error = ErrorApiResponse.fromJson(resBody);
      apiResponse.object = _error;
    }
    return apiResponse;
  }
}
