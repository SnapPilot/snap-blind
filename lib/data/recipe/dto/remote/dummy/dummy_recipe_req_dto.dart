import 'package:json_annotation/json_annotation.dart';

part 'dummy_recipe_req_dto.g.dart';

@JsonSerializable()
final class DummyRecipeReqDto {
  DummyRecipeReqDto({
    required this.limit,
    required this.skip,
    required this.select,
  });

  final int? limit;
  final int? skip;
  final String? select;

  Map<String, dynamic> toJson() => _$DummyRecipeReqDtoToJson(this);
}
