import 'package:dartz/dartz.dart';
import 'package:rick_and_morty_tdd/features/rick_and_morty/domain/entities/character.dart';
import 'package:rick_and_morty_tdd/features/rick_and_morty/domain/repositories/single_character_repository.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/all_character_repository.dart';

class GetAllCharacters extends UseCase<List<Character>, NoParams> {
  final AllCharacterRepository repository;

  GetAllCharacters(this.repository);

  @override
  Future<Either<Failure, List<Character>>> call(NoParams params) async {
    return await repository.getAllCharacter();
  }
}
