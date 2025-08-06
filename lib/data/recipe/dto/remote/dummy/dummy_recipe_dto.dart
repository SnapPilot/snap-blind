import 'package:json_annotation/json_annotation.dart';

import '../../../../../domain/recipe/entity/recipe_entity.dart';

part 'dummy_recipe_dto.g.dart';

@JsonSerializable()
final class DummyRecipeDto {
  DummyRecipeDto({
    required this.id,
    required this.name,
    required this.ingredients,
    required this.instructions,
    required this.prepTimeMinutes,
    required this.cookTimeMinutes,
    required this.servings,
    required this.difficulty,
    required this.cuisine,
    required this.caloriesPerServing,
    required this.tags,
    required this.image,
    required this.rating,
    required this.reviewsCount,
    required this.mainTypes,
  });

  final int id;
  final String name;
  final List<String> ingredients;
  final List<String> instructions;
  final int prepTimeMinutes;
  final int cookTimeMinutes;
  final int servings;
  final String difficulty;
  final String cuisine;
  final int caloriesPerServing;
  final List<String> tags;
  final String image;
  final double rating;
  @JsonKey(defaultValue: 0)
  final int reviewsCount;
  @JsonKey(defaultValue: <String>[])
  final List<String> mainTypes;

  factory DummyRecipeDto.fromJson(Map<String, dynamic> json) =>
      _$DummyRecipeDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DummyRecipeDtoToJson(this);

  RecipeEntity toEntity() {
    return RecipeEntity(
      id: id,
      name: name,
      description: instructions.firstOrNull ?? '',
      imageUrl: image,
      ingredients: ingredients,
      rating: rating,
    );
  }
}
