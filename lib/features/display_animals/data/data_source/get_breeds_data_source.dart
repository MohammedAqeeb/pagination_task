import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:pagination_task/core/constant/api_url.dart';
import 'package:pagination_task/core/error/failure.dart';
import 'package:pagination_task/features/display_animals/data/models/breeds.dart';
import 'package:http/http.dart' as http;

abstract interface class GetBreedsDataSource {
  Future<Either<Failure, List<AnimalBreeds>>> fetchAnimals(int limit, int page);
}

class GetAnimalBreedsDataSourceImpl implements GetBreedsDataSource {
  @override
  Future<Either<Failure, List<AnimalBreeds>>> fetchAnimals(
      int limit, int page) async {
    try {
      http.Response response = await http
          .get(Uri.parse('${Constant.apiUrl}limit=$limit&page=$page'));
      if (response.statusCode == 200) {
        final jsonRes = jsonDecode(response.body);

        final List<dynamic> responseData = jsonRes;

        final List<AnimalBreeds> animals =
            responseData.map((dynamic e) => AnimalBreeds.fromMap(e)).toList();

        return Right(animals);
      } else {
        return Left(Failure('Something went wrong'));
      }
    } on http.ClientException catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
