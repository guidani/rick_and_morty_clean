import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/character.dart';

abstract class AllCharacterRepository {
  Future<Either<Failure, List<Character>>> getAllCharacter();
  
}
