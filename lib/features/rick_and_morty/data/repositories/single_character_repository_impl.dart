import 'package:dartz/dartz.dart';
import 'package:rick_and_morty_tdd/core/error/exception.dart';
import 'package:rick_and_morty_tdd/core/error/failure.dart';
import 'package:rick_and_morty_tdd/core/network/network_info.dart';
import 'package:rick_and_morty_tdd/features/rick_and_morty/data/datasources/single_character/character_local_data_source.dart';
import 'package:rick_and_morty_tdd/features/rick_and_morty/data/datasources/single_character/character_remote_data_source.dart';
import 'package:rick_and_morty_tdd/features/rick_and_morty/domain/entities/character.dart';
import 'package:rick_and_morty_tdd/features/rick_and_morty/domain/repositories/single_character_repository.dart';

typedef _singleCharacter = Future<Character> Function();

class SingleCharacterRepositoryImpl extends SingleCharacterRepository {
  final SingleCharacterRemoteDataSource characterRemoteDataSource;
  final SingleCharacterLocalDataSource characterLocalDataSource;
  final NetworkInfo networkInfo;

  SingleCharacterRepositoryImpl(
      {required this.characterRemoteDataSource,
      required this.characterLocalDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, Character>> getSingleCharacter(int id) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteSingleCharacter =
            await characterRemoteDataSource.getSingleCharacter(id);
        characterLocalDataSource.cacheCharacter(remoteSingleCharacter);
        return Right(remoteSingleCharacter);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localSingleCharacter =
            await characterLocalDataSource.getLastCharacter();
        return Right(localSingleCharacter);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
