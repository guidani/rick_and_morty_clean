import 'package:rick_and_morty_tdd/features/rick_and_morty/data/models/character_model.dart';

abstract class CharacterRemoteDataSource {
  /// Throws a [ServerException] for all error codes.
  Future<CharacterModel> getSingleCharacter(int number);

  /// Throws a [ServerException] for all error codes.
  // Future<CharacterModel> getAllCharacters();
}
