import 'package:rick_and_morty_tdd/features/rick_and_morty/data/models/character_model.dart';

abstract class CharacterLocalDataSource {
  Future<CharacterModel> getLastCharacter();
  Future<void> cacheCharacter(CharacterModel characterToCache);
}