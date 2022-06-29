import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rick_and_morty_tdd/core/network/network_info.dart';

class MockDataConnectionChecker extends Mock implements InternetConnectionChecker {}

void main() {
  final mockDataConnectionChecker = MockDataConnectionChecker();
  final networkInfo = NetworkInfoImpl(mockDataConnectionChecker);

  group('isConnected', () {
    test('should forward the call to DataConnectionChecker.hasConnection',
        () async {
      // arrange
      final tHasConnectionFuture = Future.value(true);
      when(() => mockDataConnectionChecker.hasConnection)
          .thenAnswer((_) => tHasConnectionFuture);
      //act
      final result = networkInfo.isConnected;
      // assert
      verify(() => mockDataConnectionChecker.hasConnection);
      expect(result, tHasConnectionFuture);
    });
  });
}
