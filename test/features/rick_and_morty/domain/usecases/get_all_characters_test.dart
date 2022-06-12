import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rick_and_morty_tdd/core/usecases/usecase.dart';
import 'package:rick_and_morty_tdd/features/rick_and_morty/domain/entities/character.dart';
import 'package:rick_and_morty_tdd/features/rick_and_morty/domain/repositories/all_character_repository.dart';
import 'package:rick_and_morty_tdd/features/rick_and_morty/domain/repositories/single_character_repository.dart';
import 'package:rick_and_morty_tdd/features/rick_and_morty/domain/usecases/get_all_characters.dart';

class MockCharacterRepository extends Mock implements AllCharacterRepository {}

void main() {
  final mockCharacterRepository = MockCharacterRepository();
  final usecase = GetAllCharacters(mockCharacterRepository);

  final tCharacter = Character(
    id: 1,
    name: 'name',
    status: 'status',
    species: 'species',
    type: 'type',
    gender: 'gender',
    image: 'image',
    url: 'url',
  );

  final tListCharacter = [tCharacter];

  test('Should return a list of characters', () async {
    when(() => mockCharacterRepository.getAllCharacter())
        .thenAnswer((_) async => Right(tListCharacter));

    final result = await usecase(NoParams());

    expect(result, Right(tListCharacter));

    verify(() => mockCharacterRepository.getAllCharacter());
    verifyNoMoreInteractions(mockCharacterRepository);
  });
}
