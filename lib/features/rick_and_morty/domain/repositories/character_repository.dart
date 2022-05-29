import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/character.dart';

abstract class CharacterRepository {
  Future<Either<Failure, List<Character>>> getAllCharacter();
  Future<Either<Failure, Character>> getSingleCharacter(int id);
}
