import 'package:fpdart/fpdart.dart';
import 'package:pagination_task/core/error/failure.dart';
import 'package:pagination_task/features/display_animals/data/models/breeds.dart';

abstract interface class FetchAnimalRepository {
  Future<Either<Failure, List<AnimalBreeds>>> getAnimalBreeds(int limit, int page);
}
