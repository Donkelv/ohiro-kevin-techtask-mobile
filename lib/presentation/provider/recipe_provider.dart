import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tech_task/data/datasources/recipe.dart';
import 'package:tech_task/data/repositories/get_ingredient.dart';
import 'package:tech_task/data/repositories/get_recipe.dart';
import 'package:tech_task/domain/repositories/recipe.dart';
import 'package:tech_task/presentation/state/recipe_list_state.dart';

import '../state/ingredient_list_state.dart';

final getIngredientListProvider =
    StateNotifierProvider<GetIngredientNotifier, IngredientListState>((ref) {
  return GetIngredientNotifier(
      baseRecipeRepository: ref.watch(baseRecipeProvider), ref: ref);
});

final getRecipeListProvider =
    StateNotifierProvider<GetRecipeNotifier, RecipeListState>((ref) {
  return GetRecipeNotifier(
      baseRecipeRepository: ref.watch(baseRecipeProvider), ref: ref);
});

final baseRecipeProvider = Provider<BaseRecipeRepository>((ref) {
  return RecipeRepository();
});
