import 'package:dio/dio.dart' as dio;
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:tech_task/data/datasources/err_response.dart';
import 'package:tech_task/domain/repositories/recipe.dart';
import 'package:tech_task/domain/entites/failure.dart';
import 'package:tech_task/domain/entites/ingredient.dart';
import 'package:tech_task/domain/entites/recipe.dart';
import 'package:tech_task/util/api_const.dart';

class RecipeRepository extends BaseRecipeRepository {
  @override
  Future<Either<Failure, List<IngredientEntity>>> getIngredent() async {
    String url = baseUrl + ingredientConst;
    try {
      final response = await dio.Dio().get(
        url,
        options: dio.Options(
          method: "Get",
          sendTimeout: const Duration(milliseconds: 30000),
          receiveTimeout: const Duration(milliseconds: 30000),
        ),
      );

      if (kDebugMode) {
        print("The response is");
        print(response.data);
      }
     
      if (response.statusCode == 200) {
        List<IngredientEntity> ingredient =
            (response.data as List<dynamic>).map((element) {
          return IngredientEntity.fromJson(element);
        }).toList();
        return Right(ingredient);
      } else {
        return Left(Failure(message: "Problem encountered please try again"));
      }
    } catch (err) {
      if (kDebugMode) {
        print("The error is $err");
      }
      return Left(
        Failure(
          message: errResponse(err),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<RecipeEntity>>> getRecipe(
      String ingredient) async {
    debugPrint("the ingredient selected is $ingredient");
    String url = baseUrl + recipesConst + ingredient;
    try {
      final response = await dio.Dio().get(
        url,
        options: dio.Options(
          method: "Get",
          sendTimeout: const Duration(milliseconds: 30000),
          receiveTimeout: const Duration(milliseconds: 30000),
        ),
      );

      if (kDebugMode) {
        print("The response is");
        print(response.data);
      }
      //Map<String, dynamic> content = response.data;
      if (response.statusCode == 200) {
        List<RecipeEntity> recipe =
            (response.data as List<dynamic>).map((element) {
          return RecipeEntity.fromJson(element);
        }).toList();
        //RecipeEntity recipeEntity = RecipeEntity.fromJson(content);
        return Right(recipe);
      } else {
        return Left(Failure(message: "Problem encountered please try again"));
      }
    } catch (err) {
      if (kDebugMode) {
        print("The error is $err");
      }
      return Left(
        Failure(
          message: errResponse(err),
        ),
      );
    }
  }
}
