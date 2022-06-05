import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/location.dart';

abstract class LocationRepository {
  Future<Either<Failure, Location>> getAllLocation();
  Future<Either<Failure, Location>> getSingleLocation(int id);
}
