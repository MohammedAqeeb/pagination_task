part of 'fetch_breeds_cubit.dart';

@immutable
sealed class FetchBreedsState {}

final class FetchBreedsLoading extends FetchBreedsState {}

final class FetchBreedsSuccess extends FetchBreedsState {
  final List<AnimalBreeds> animals;

  FetchBreedsSuccess({required this.animals});
}

final class FetchBreedsFailure extends FetchBreedsState {
  final String errorMessage;

  FetchBreedsFailure({required this.errorMessage});
}

final class FetchBreedsLoadingMore extends FetchBreedsState {
  final List<AnimalBreeds> animals;

  FetchBreedsLoadingMore({required this.animals});
}
