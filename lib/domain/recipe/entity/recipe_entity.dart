import 'package:json_annotation/json_annotation.dart';

part 'recipe_entity.g.dart';

@JsonSerializable()
class RecipeEntity {
  RecipeEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.ingredients,
    required this.rating,
  });

  final int id;
  final String name;
  final String description;
  final String imageUrl;
  final List<String> ingredients;
  final double rating;

  factory RecipeEntity.fromJson(Map<String, dynamic> json) =>
      _$RecipeEntityFromJson(json);
}
