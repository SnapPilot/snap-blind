import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
sealed class RecipeEvent extends Equatable {
  const RecipeEvent();

  @override
  List<Object?> get props => [];
}

final class RecipeRequestedEvent extends RecipeEvent {}
