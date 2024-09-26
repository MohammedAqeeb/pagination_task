import 'package:fpdart/fpdart.dart';
import 'package:pagination_task/core/error/failure.dart';
import 'package:pagination_task/features/display_animals/data/data_source/get_breeds_data_source.dart';
import 'package:pagination_task/features/display_animals/data/models/breeds.dart';
import 'package:pagination_task/features/display_animals/domain/repository/fetch_animal_repository.dart';

class FetchAnimalRepoImpl implements FetchAnimalRepository {
  final GetBreedsDataSource getBreedsDataSource;

  FetchAnimalRepoImpl({required this.getBreedsDataSource});
  @override
  Future<Either<Failure, List<AnimalBreeds>>> getAnimalBreeds(
      int limit, int page) async {
    return await getBreedsDataSource.fetchAnimals(limit, page);
  }
}
