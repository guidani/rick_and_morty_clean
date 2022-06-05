import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:rick_and_morty_tdd/core/usecases/usecase.dart';
import 'package:rick_and_morty_tdd/features/rick_and_morty/domain/entities/character.dart';
import 'package:rick_and_morty_tdd/features/rick_and_morty/domain/repositories/character_repository.dart';

import '../../../../core/error/failure.dart';

class GetSingleCharacters extends UseCase<Character, Params> {
  final CharacterRepository repository;

  GetSingleCharacters(this.repository);

  @override
  Future<Either<Failure, Character>> call(Params params) async {
    return await repository.getSingleCharacter(params.id);
  }
}

class Params extends Equatable {
  final int id;

  const Params({required this.id});

  @override
  List<Object?> get props => throw UnimplementedError();
}
