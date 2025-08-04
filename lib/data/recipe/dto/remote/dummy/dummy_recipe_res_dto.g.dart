// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dummy_recipe_res_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DummyRecipeResDto _$DummyRecipeResDtoFromJson(Map<String, dynamic> json) =>
    DummyRecipeResDto(
      recipes:
          (json['recipes'] as List<dynamic>)
              .map((e) => DummyRecipeDto.fromJson(e as Map<String, dynamic>))
              .toList(),
      total: (json['total'] as num?)?.toInt() ?? 10,
      skip: (json['skip'] as num?)?.toInt() ?? 0,
      limit: (json['limit'] as num).toInt(),
    );

Map<String, dynamic> _$DummyRecipeResDtoToJson(DummyRecipeResDto instance) =>
    <String, dynamic>{
      'recipes': instance.recipes,
      'total': instance.total,
      'skip': instance.skip,
      'limit': instance.limit,
    };
