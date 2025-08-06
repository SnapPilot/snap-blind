import 'package:json_annotation/json_annotation.dart';
import 'package:snap_blind/data/recipe/dto/remote/dummy/dummy_recipe_dto.dart';

part 'dummy_recipe_res_dto.g.dart';

@JsonSerializable()
final class DummyRecipeResDto {
  DummyRecipeResDto({
    required this.recipes,
    required this.total,
    required this.skip,
    required this.limit,
  });

  final List<DummyRecipeDto> recipes;
  @JsonKey(defaultValue: 10)
  final int total;
  @JsonKey(defaultValue: 0)
  final int skip;
  final int limit;

  factory DummyRecipeResDto.fromJson(Map<String, dynamic> json) =>
      _$DummyRecipeResDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DummyRecipeResDtoToJson(this);
}
