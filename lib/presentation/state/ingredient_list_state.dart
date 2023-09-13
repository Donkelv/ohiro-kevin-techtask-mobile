import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tech_task/domain/entites/ingredient.dart';

part 'ingredient_list_state.freezed.dart';




extension IngredientListStateGetters on IngredientListState {
  bool get isLoading => this is Loading;
  bool get isError => this is ErrorMessage;
  IngredientEntity get data => (this as Loaded).data;
}

@freezed
abstract class IngredientListState with _$IngredientListState {
  const factory IngredientListState.initial() = Initial;
  const factory IngredientListState.loading() = Loading;
  const factory IngredientListState.empty() = Empty;
  const factory IngredientListState.loaded({required IngredientEntity data}) = Loaded;
  const factory IngredientListState.error({required String message}) = ErrorMessage;
}
