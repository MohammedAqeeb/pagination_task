import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:pagination_task/features/display_animals/data/data_source/get_breeds_data_source.dart';
import 'package:pagination_task/features/display_animals/data/repository/fetch_animal_repo_impl.dart';
import 'package:pagination_task/features/display_animals/domain/usecase/fetch_animal_usecase.dart';
import 'package:pagination_task/features/display_animals/presentation/cubit/fetch_breeds_cubit.dart';

import 'features/display_animals/domain/repository/fetch_animal_repository.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependency() async{
  serviceLocator
    ..registerSingleton<GetBreedsDataSource>(
      GetAnimalBreedsDataSourceImpl(),
    )
    ..registerSingleton<FetchAnimalRepository>(
      FetchAnimalRepoImpl(
        getBreedsDataSource: serviceLocator(),
      ),
    )
    ..registerSingleton(
      FetchAnimalUseCase(
        repository: serviceLocator(),
      ),
    )
    ..registerSingleton(
      FetchBreedsCubit(
        fetchAnimalUseCase: serviceLocator(),
      ),
    );
}
