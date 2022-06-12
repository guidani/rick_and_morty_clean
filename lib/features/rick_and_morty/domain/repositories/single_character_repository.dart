import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/character.dart';

abstract class SingleCharacterRepository {
  Future<Either<Failure, Character>> getSingleCharacter(int id);
}
