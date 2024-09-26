import 'package:fpdart/fpdart.dart';
import 'package:pagination_task/core/error/failure.dart';
import 'package:pagination_task/core/usecase/common.dart';
import 'package:pagination_task/features/display_animals/data/models/breeds.dart';
import 'package:pagination_task/features/display_animals/domain/repository/fetch_animal_repository.dart';

class FetchAnimalUseCase implements UseCase<List<AnimalBreeds>, AnimalParams> {
  final FetchAnimalRepository repository;

  FetchAnimalUseCase({required this.repository});

  @override
  Future<Either<Failure, List<AnimalBreeds>>> call(AnimalParams params) async {
    return await repository.getAnimalBreeds(params.limit, params.page);
  }
}
