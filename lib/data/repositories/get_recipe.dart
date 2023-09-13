import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tech_task/domain/repositories/recipe.dart';
import 'package:tech_task/presentation/state/recipe_list_state.dart';

class GetRecipeNotifier extends StateNotifier<RecipeListState> {
  GetRecipeNotifier(
      {required this.ref, required BaseRecipeRepository baseRecipeRepository})
      : _baseRecipeRepository = baseRecipeRepository,
        super(const RecipeListState.initial());

  final Ref ref;
  final BaseRecipeRepository _baseRecipeRepository;

  Future<void> getRecipeList({required String ingredient}) async {
    state = RecipeListState.initial();
    final response = await _baseRecipeRepository.getRecipe(ingredient);
    response.fold((l) {
      state = RecipeListState.error(message: l.message);
    }, (r) {
      if (r.ingredients!.isEmpty) {
        state = RecipeListState.empty();
      } else {
        state = RecipeListState.loaded(data: r);
      }
    });
  }
}
