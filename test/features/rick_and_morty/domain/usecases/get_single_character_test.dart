import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rick_and_morty_tdd/features/rick_and_morty/domain/entities/character.dart';
import 'package:rick_and_morty_tdd/features/rick_and_morty/domain/repositories/single_character_repository.dart';
import 'package:rick_and_morty_tdd/features/rick_and_morty/domain/usecases/get_single_character.dart';

class MockCharacterRepository extends Mock implements SingleCharacterRepository {}

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
    image: 'image',
    url: 'url',
  );

  const tNumber = 1;

  test('Shoul return a single character', () async {
    when(() => mockCharacterRepository.getSingleCharacter(tNumber))
        .thenAnswer((_) async => Right(tCharacter));

    final result = await usecase(const Params(id: tNumber));

    expect(result, Right(tCharacter));

    verify(() => mockCharacterRepository.getSingleCharacter(tNumber));
    verifyNoMoreInteractions(mockCharacterRepository);
  });
}
