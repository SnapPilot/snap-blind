// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dummy_recipe_req_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DummyRecipeReqDto _$DummyRecipeReqDtoFromJson(Map<String, dynamic> json) =>
    DummyRecipeReqDto(
      limit: (json['limit'] as num?)?.toInt(),
      skip: (json['skip'] as num?)?.toInt(),
      select: json['select'] as String?,
    );

Map<String, dynamic> _$DummyRecipeReqDtoToJson(DummyRecipeReqDto instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'skip': instance.skip,
      'select': instance.select,
    };
