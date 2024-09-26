import 'package:pagination_task/features/display_animals/data/models/height.dart';
import 'package:pagination_task/features/display_animals/data/models/weight.dart';

class AnimalBreeds {
  final Weight weight;
  final Height height;
  final int id;
  final String name;
  final String countryCode;
  final String bredFor;
  final String breedGroup;
  final String lifeSpan;
  final String temperament;
  final String referenceImageId;

  AnimalBreeds({
    required this.weight,
    required this.height,
    required this.id,
    required this.name,
    required this.countryCode,
    required this.bredFor,
    required this.breedGroup,
    required this.lifeSpan,
    required this.temperament,
    required this.referenceImageId,
  });

  factory AnimalBreeds.fromMap(Map<String, dynamic> map) {
    return AnimalBreeds(
      weight: Weight.fromMap(map['weight'] as Map<String, dynamic>),
      height: Height.fromMap(map['height'] as Map<String, dynamic>),
      id: (map['id'] ?? 0) as int,
      name: (map['name'] ?? '') as String,
      countryCode: (map['country_code'] ?? '') as String,
      bredFor: (map['bred_for'] ?? '') as String,
      breedGroup: (map['breed_group'] ?? '') as String,
      lifeSpan: (map['life_span'] ?? '') as String,
      temperament: (map['temperament'] ?? '') as String,
      referenceImageId: (map['reference_image_id'] ?? '') as String,
    );
  }
}
