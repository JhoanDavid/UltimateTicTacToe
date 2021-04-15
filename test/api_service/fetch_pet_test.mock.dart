import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ultimate_tic_tac_toe/Model/pet_model.dart';
import 'package:ultimate_tic_tac_toe/resource/constants.dart';
import 'package:ultimate_tic_tac_toe/utils/apiresponse_model.dart';

import '../../lib/repository/pet_Api_Service.dart';
import 'fetch_pet_test.mock.mocks.dart';
@GenerateMocks([http.Client])
void main() {
  group('getPetById', () {
    test('Retorna una mascota encontrada por el id', () async {
      final client = MockClient();

      // Use Mockito to return a successful response when it calls the
      // provided http.Client.
      when(client
              .get(Uri.https(Constants.urlAuthority, Constants.urlFindByIdPet)))
          .thenAnswer((_) async => http.Response(
              '{"id": 37,"nombre": "Corso", "raza": "Criollo", "sexo": "Macho","edad": 8,"fechaCreacion": "2021-04-12","estado": false,"idCliente": "Johan" }',
              200));

      expect(await PetApiService().getPetById(37), isA<ApiResponse>());
    });
    /*
    test('throws an exception if the http call completes with an error', () {
      final client = MockClient();

      // Use Mockito to return an unsuccessful response when it calls the
      // provided http.Client.
      when(client.get(Uri.https('jsonplaceholder.typicode.com', 'albums/1')))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      expect(fetchAlbum(client), throwsException);
    });*/
  });
}