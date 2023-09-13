import 'package:dartz/dartz.dart';
import 'package:tech_task/domain/entites/failure.dart';
import 'package:tech_task/domain/entites/ingredient.dart';
import 'package:tech_task/domain/entites/recipe.dart';

abstract class BaseRecipeRepository {
  Future<Either<Failure, RecipeEntity>> getRecipe(String ingredient);
  Future<Either<Failure, List<IngredientEntity>>> getIngredent();
}
