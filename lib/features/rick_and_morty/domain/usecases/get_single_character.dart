import 'package:dartz/dartz.dart';
import 'package:rick_and_morty_tdd/features/rick_and_morty/domain/entities/character.dart';
import 'package:rick_and_morty_tdd/features/rick_and_morty/domain/repositories/character_repository.dart';

import '../../../../core/error/failure.dart';

class GetSingleCharacters {
  final CharacterRepository repository;

  GetSingleCharacters(this.repository);

  Future<Either<Failure, Character>> call(int id) async {
    return await repository.getSingleCharacter(id);
  }
}