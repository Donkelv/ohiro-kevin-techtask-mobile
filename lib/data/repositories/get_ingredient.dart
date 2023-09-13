
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tech_task/domain/repositories/recipe.dart';
import 'package:tech_task/presentation/state/ingredient_list_state.dart';

class GetIngredientNotifier extends StateNotifier<IngredientListState> {
  GetIngredientNotifier(
      { this.ref, required BaseRecipeRepository baseRecipeRepository})
      : _baseRecipeRepository = baseRecipeRepository,
        super(const IngredientListState.initial());

  final Ref? ref;
  final BaseRecipeRepository _baseRecipeRepository;

  Future<void> getIngredientList() async {
    state = IngredientListState.initial();
    final response = await _baseRecipeRepository.getIngredent();
    response.fold((l) {
      state = IngredientListState.error(message: l.message);
    }, (r) {
      if (r.isEmpty) {
        state = IngredientListState.empty();
      } else {
        state = IngredientListState.loaded(data: r);
      }
    });
  }
}
