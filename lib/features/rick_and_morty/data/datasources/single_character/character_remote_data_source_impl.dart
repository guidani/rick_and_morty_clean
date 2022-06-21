import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rick_and_morty_tdd/core/error/exception.dart';
import 'package:rick_and_morty_tdd/features/rick_and_morty/data/datasources/single_character/character_remote_data_source.dart';
import 'package:rick_and_morty_tdd/features/rick_and_morty/data/models/character_model.dart';

class CharacterRemoteDataSourceImpl implements SingleCharacterRemoteDataSource {
  final http.Client client;
  //https://rickandmortyapi.com/api/character/2
  CharacterRemoteDataSourceImpl({required this.client});
  @override
  Future<CharacterModel> getSingleCharacter(int number) async {
    final response = await client.get(
      Uri.parse("https://rickandmortyapi.com/api/character/$number"),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      return CharacterModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException();
    }
  }
}
