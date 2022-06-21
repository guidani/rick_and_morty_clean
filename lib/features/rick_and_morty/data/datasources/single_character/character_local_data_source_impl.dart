import 'dart:convert';

import 'package:rick_and_morty_tdd/core/error/exception.dart';
import 'package:rick_and_morty_tdd/features/rick_and_morty/data/datasources/single_character/character_local_data_source.dart';
import 'package:rick_and_morty_tdd/features/rick_and_morty/data/models/character_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

const CACHED_SINGLE_CHARACTER = 'CACHED_SINGLE_CHARACTER';

class CharacterLocalDataSourceImpl implements SingleCharacterLocalDataSource {
  final SharedPreferences sharedPreferences;

  CharacterLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> cacheCharacter(CharacterModel characterToCache) {
    return sharedPreferences.setString(
        CACHED_SINGLE_CHARACTER, jsonEncode(characterToCache.toJson()));
  }

  @override
  Future<CharacterModel> getLastCharacter() {
    final jsonString = sharedPreferences.getString(CACHED_SINGLE_CHARACTER);
    if (jsonString != null) {
      return Future.value(CharacterModel.fromJson(jsonDecode(jsonString)));
    } else {
      throw CacheException();
    }
  }
}
