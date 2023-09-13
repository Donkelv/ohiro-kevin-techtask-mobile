import 'dart:convert';

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
      //Map<String, dynamic> content = response.data;
      var data = jsonDecode(response.data);
      if (response.statusCode == 200) {
        List<IngredientEntity> ingredient = data.map((element) {
          return IngredientEntity.fromJson(element);
        }).toList();

        ///IngredientEntity ingredientEntity = IngredientEntity.fromJson(content);
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
  Future<Either<Failure, RecipeEntity>> getRecipe(String ingredient) async {
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
      Map<String, dynamic> content = response.data;
      if (response.statusCode == 200) {
        RecipeEntity recipeEntity = RecipeEntity.fromJson(content);
        return Right(recipeEntity);
      } else {
        return Left(Failure(message: content['message']));
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
