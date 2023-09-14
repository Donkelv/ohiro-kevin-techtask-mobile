import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tech_task/domain/entites/recipe.dart';

part 'recipe_list_state.freezed.dart';

extension RecipeListStateGetters on RecipeListState {
  bool get isLoading => this is Loading;
  bool get isError => this is ErrorMessage;
  List<RecipeEntity> get data => (this as Loaded).data;
}

@freezed
abstract class RecipeListState with _$RecipeListState {
  const factory RecipeListState.initial() = Initial;
  const factory RecipeListState.loading() = Loading;
  const factory RecipeListState.empty() = Empty;
  const factory RecipeListState.loaded({required List<RecipeEntity> data}) =
      Loaded;
  const factory RecipeListState.error({required String message}) =
      ErrorMessage;
}
