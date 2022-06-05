import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:rick_and_morty_tdd/features/rick_and_morty/data/models/character_model.dart';
import 'package:rick_and_morty_tdd/features/rick_and_morty/domain/entities/character.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tCharacterModel = CharacterModel(
    id: 1,
    name: 'name',
    status: 'status',
    species: 'species',
    type: 'type',
    gender: 'gender',
    image: 'image',
    url: 'url',
  );

  test('Should be a subclass of Character entity', () {
    expect(tCharacterModel, isA<Character>());
  });

  group('from json', () {
    test('should return a valid model when the JSON is valid', () async {
      // arrange
      final Map<String, dynamic> jsonMap =
          jsonDecode(fixtures('character.json'));

      // act
      final result = CharacterModel.fromJson(jsonMap);

      // asset
      expect(result, tCharacterModel);
    });
  });

  group('to json', () {
    test('Should return a json map with the proper data', () async {
//act
      final result = tCharacterModel.toJson();

      // assert
      final expectedJsonMap = {
        "id": 1,
        "name": 'name',
        "status": 'status',
        "species": 'species',
        "type": 'type',
        "gender": 'gender',
        "image": 'image',
        "url": 'url'
      };

      expect(result, expectedJsonMap);
    });
  });
}
