// import 'package:dartz/dartz.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:rick_and_morty_tdd/core/error/exception.dart';
// import 'package:rick_and_morty_tdd/core/error/failure.dart';
// import 'package:rick_and_morty_tdd/core/network/network_info.dart';
// import 'package:rick_and_morty_tdd/features/rick_and_morty/data/datasources/single_character/character_local_data_source.dart';
// import 'package:rick_and_morty_tdd/features/rick_and_morty/data/datasources/single_character/character_remote_data_source.dart';
// import 'package:rick_and_morty_tdd/features/rick_and_morty/data/models/character_model.dart';
// import 'package:rick_and_morty_tdd/features/rick_and_morty/data/repositories/single_character_repository_impl.dart';
// import 'package:rick_and_morty_tdd/features/rick_and_morty/domain/entities/character.dart';

// class MockRemoteDataSource extends Mock
//     implements SingleCharacterRemoteDataSource {}

// class MockLocalDataSource extends Mock
//     implements SingleCharacterLocalDataSource {}

// class MockNetworkInfo extends Mock implements NetworkInfo {}

// void main() {
//   final mockRemoteDataSource = MockRemoteDataSource();
//   final mockLocalDataSource = MockLocalDataSource();
//   final mockNetworkInfo = MockNetworkInfo();
//   final repository = SingleCharacterRepositoryImpl(
//     characterLocalDataSource: mockLocalDataSource,
//     networkInfo: mockNetworkInfo,
//     characterRemoteDataSource: mockRemoteDataSource,
//   );

//   void runTestsOnline(Function body) {
//     group('Device is online', () {
//       setUp(() {
//         when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
//       });

//       body();
//     });
//   }

//   void runTestsoffline(Function body) {
//     group('Device is offline', () {
//       setUp(() {
//         when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => false);
//       });

//       body();
//     });
//   }

//   group('getConcreteNumberTrivia', () {
//     const tNumber = 1;
//     final tCharacterModel = CharacterModel(
//       id: 1,
//       name: 'name',
//       status: 'status',
//       species: 'species',
//       type: 'type',
//       gender: 'gender',
//       image: 'image',
//       url: 'url',
//     );
//     final Character tCharacter = tCharacterModel;

//     test('should check if the device is online', () {
//       // arrange
//       when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);

//       // act
//       repository.getSingleCharacter(tNumber);

//       // assert
//       verify(() => mockNetworkInfo.isConnected);
//     });

//     runTestsOnline(() {
//       test(
//           'should return remote data when the call to remote data source is success',
//           () async {
//         // arrange
//         when(() => mockRemoteDataSource.getSingleCharacter(tNumber))
//             .thenAnswer((_) async => tCharacterModel);

//         // act
//         final result = await repository.getSingleCharacter(tNumber);

//         // assert
//         verify(() => mockRemoteDataSource.getSingleCharacter(tNumber));
//         expect(result, equals(Right(tCharacter)));
//       });

//       test(
//           'should cache the data locally when the call to remote data source is successful',
//           () async {
//         //arrange
//         when(() => mockRemoteDataSource.getSingleCharacter(tNumber))
//             .thenAnswer((_) async => tCharacterModel);
//         // act
//         await repository.getSingleCharacter(tNumber);

//         // assert
//         verify(() => mockRemoteDataSource.getSingleCharacter(tNumber));
//         verify(() => mockLocalDataSource.cacheCharacter(tCharacterModel));
//       });

//       test(
//           'Should return server failure when the call to remote data source is unsuccessful',
//           () async {
//         // arrange
//         when(() => mockRemoteDataSource.getSingleCharacter(tNumber))
//             .thenThrow(ServerException());

//         // act
//         final result = await repository.getSingleCharacter(tNumber);

//         // assert
//         verify(() => mockRemoteDataSource.getSingleCharacter(tNumber));
//         verifyZeroInteractions(mockLocalDataSource);
//         expect(result, equals(Left(ServerFailure())));
//       });
//     });

//     runTestsoffline(() {
//       test(
//           'Should return last locally cached data when the cached data is present',
//           () async {
//         //arrange
//         when(() => mockLocalDataSource.getLastCharacter())
//             .thenAnswer((_) async => tCharacterModel);

//         //act
//         final result = await repository.getSingleCharacter(tNumber);

//         // assert
//         verifyZeroInteractions(mockRemoteDataSource);
//         verify(() => mockLocalDataSource.getLastCharacter());
//         expect(result, equals(Right(tCharacter)));
//       });

//       test('should return CacheFailure when there is no cached data present',
//           () async {
//         // arrange
//         when(() => mockLocalDataSource.getLastCharacter())
//             .thenThrow(CacheException());
//         // act
//         final result = await repository.getSingleCharacter(tNumber);
//         // assert
//         verifyZeroInteractions(mockRemoteDataSource);
//         verify(() => mockLocalDataSource.getLastCharacter());
//         expect(result, equals(left(CacheFailure())));
//       });
//     });
//   });
// }
