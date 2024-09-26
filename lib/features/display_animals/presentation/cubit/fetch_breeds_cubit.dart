import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pagination_task/core/usecase/common.dart';
import 'package:pagination_task/features/display_animals/data/models/breeds.dart';
import 'package:pagination_task/features/display_animals/domain/usecase/fetch_animal_usecase.dart';

part 'fetch_breeds_state.dart';

class FetchBreedsCubit extends Cubit<FetchBreedsState> {
  final FetchAnimalUseCase _fetchAnimalUseCase;

  FetchBreedsCubit({
    required FetchAnimalUseCase fetchAnimalUseCase,
  })  : _fetchAnimalUseCase = fetchAnimalUseCase,
        super(FetchBreedsLoading());

  int _page = 1;
  final int _limit = 10;
  List<AnimalBreeds> _animals = [];
  bool _isLoadingMore = false;

  // Function to initially load the data
  //
  void fetchInitialResults() async {
    _page = 1;
    _animals.clear();
    emit(FetchBreedsLoading());
    final result = await _fetchAnimalUseCase
        .call(AnimalParams(limit: _limit, page: _page));

    result.fold(
      (error) => emit(FetchBreedsFailure(errorMessage: error.message)),
      (dataList) {
        _animals = dataList;
        emit(FetchBreedsSuccess(animals: _animals));
      },
    );
  }

  // Function to fetch next set of data
  //
  void fetchNextPage() async {
    if (_isLoadingMore) return;
    _isLoadingMore = true;
    _page++;
    emit(FetchBreedsLoadingMore(animals: _animals));

    final result = await _fetchAnimalUseCase
        .call(AnimalParams(limit: _limit, page: _page));

    result.fold(
      (error) {
        _isLoadingMore = false;
        emit(FetchBreedsFailure(errorMessage: error.message));
      },
      (dataList) {
        _isLoadingMore = false;
        _animals.addAll(dataList);
        emit(FetchBreedsSuccess(animals: _animals));
      },
    );
  }
}
