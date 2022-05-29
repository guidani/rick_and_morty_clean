import 'package:dartz/dartz.dart';
import 'package:rick_and_morty_tdd/features/rick_and_morty/domain/entities/character.dart';
import 'package:rick_and_morty_tdd/features/rick_and_morty/domain/repositories/character_repository.dart';

import '../../../../core/error/failure.dart';

class GetAllCharacters {
  final CharacterRepository repository;

  GetAllCharacters(this.repository);

  Future<Either<Failure, List<Character>>> call() async {
    return await repository.getAllCharacter();
  }
}
