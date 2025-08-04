// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipeEntity _$RecipeEntityFromJson(Map<String, dynamic> json) => RecipeEntity(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  description: json['description'] as String,
  imageUrl: json['imageUrl'] as String,
  ingredients:
      (json['ingredients'] as List<dynamic>).map((e) => e as String).toList(),
  rating: (json['rating'] as num).toDouble(),
);

Map<String, dynamic> _$RecipeEntityToJson(RecipeEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'ingredients': instance.ingredients,
      'rating': instance.rating,
    };
