// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dummy_recipe_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DummyRecipeDto _$DummyRecipeDtoFromJson(
  Map<String, dynamic> json,
) => DummyRecipeDto(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  ingredients:
      (json['ingredients'] as List<dynamic>).map((e) => e as String).toList(),
  instructions:
      (json['instructions'] as List<dynamic>).map((e) => e as String).toList(),
  prepTimeMinutes: (json['prepTimeMinutes'] as num).toInt(),
  cookTimeMinutes: (json['cookTimeMinutes'] as num).toInt(),
  servings: (json['servings'] as num).toInt(),
  difficulty: json['difficulty'] as String,
  cuisine: json['cuisine'] as String,
  caloriesPerServing: (json['caloriesPerServing'] as num).toInt(),
  tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
  image: json['image'] as String,
  rating: (json['rating'] as num).toDouble(),
  reviewsCount: (json['reviewsCount'] as num?)?.toInt() ?? 0,
  mainTypes:
      (json['mainTypes'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      [],
);

Map<String, dynamic> _$DummyRecipeDtoToJson(DummyRecipeDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'ingredients': instance.ingredients,
      'instructions': instance.instructions,
      'prepTimeMinutes': instance.prepTimeMinutes,
      'cookTimeMinutes': instance.cookTimeMinutes,
      'servings': instance.servings,
      'difficulty': instance.difficulty,
      'cuisine': instance.cuisine,
      'caloriesPerServing': instance.caloriesPerServing,
      'tags': instance.tags,
      'image': instance.image,
      'rating': instance.rating,
      'reviewsCount': instance.reviewsCount,
      'mainTypes': instance.mainTypes,
    };
