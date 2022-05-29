import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rick_and_morty_tdd/features/rick_and_morty/domain/entities/character.dart';
import 'package:rick_and_morty_tdd/features/rick_and_morty/domain/entities/character_location.dart';
import 'package:rick_and_morty_tdd/features/rick_and_morty/domain/repositories/character_repository.dart';
import 'package:rick_and_morty_tdd/features/rick_and_morty/domain/usecases/get_single_character.dart';

class MockCharacterRepository extends Mock implements CharacterRepository {}

void main() {
  final mockCharacterRepository = MockCharacterRepository();
  final usecase = GetSingleCharacters(mockCharacterRepository);

  final tCharacter = Character(
    id: 1,
    name: 'name',
    status: 'status',
    species: 'species',
    type: 'type',
    gender: 'gender',
    origin: CharacterLocation(name: 'teste', url: ''),
    location: CharacterLocation(name: 'teste', url: ''),
    image: 'image',
    episode: [],
    url: 'url',
    created: DateTime(2022),
  );

  final tNumber = 1;

  test('Shoul return a single character', () async {
    when(() => mockCharacterRepository.getSingleCharacter(tNumber))
        .thenAnswer((_) async => Right(tCharacter));

    final result = await usecase.call(tNumber);

    expect(result, Right(tCharacter));

    verify(() => mockCharacterRepository.getSingleCharacter(tNumber));
    verifyNoMoreInteractions(mockCharacterRepository);
  });
}
