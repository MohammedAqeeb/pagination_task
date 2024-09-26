import 'package:fpdart/fpdart.dart';
import 'package:pagination_task/core/error/failure.dart';

abstract interface class UseCase<Type, AnimalParams> {
  Future<Either<Failure, Type>> call(AnimalParams noparam);
}

class AnimalParams {
  final int limit;
  final int page;

  AnimalParams({required this.limit, required this.page});
}
