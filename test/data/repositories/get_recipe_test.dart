import 'package:mocktail/mocktail.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tech_task/data/repositories/get_recipe.dart';
import 'package:tech_task/domain/entites/failure.dart';
import 'package:tech_task/domain/entites/recipe.dart';
import 'package:tech_task/domain/repositories/recipe.dart';
import 'package:tech_task/presentation/state/recipe_list_state.dart';

class MockRecipeRepository extends Mock implements BaseRecipeRepository {}

void main() {
  late MockRecipeRepository mockRecipeRepository;
  late ProviderContainer container;
  late GetRecipeNotifier recipeNotifier;

  setUp(() {
    mockRecipeRepository = MockRecipeRepository();
    container = ProviderContainer();
    recipeNotifier =
        GetRecipeNotifier(baseRecipeRepository: mockRecipeRepository);
  });

  tearDown(() {
    container.dispose();
  });

  group('GetRecipeNotifier', () {
    test('Should update state to loaded when Recipe data is fetched', () async {
      List<RecipeEntity> mockRecipe = [
        RecipeEntity(
          title: "title",
          ingredients: ["ingredient 1"],
        )
      ];
      when(() => mockRecipeRepository.getRecipe("ingredient"))
          .thenAnswer((_) async => Right(mockRecipe));

      await recipeNotifier.getRecipeList(ingredient: "ingredient");

      expect(recipeNotifier.state, isA<Loaded>());
      expect((recipeNotifier.state as Loaded).data, mockRecipe);
    });

    test('Should update state to Empty when Recipe  ingredient  is empty',
        () async {
      List<RecipeEntity> mockRecipe = [
       
      ];
      when(() => mockRecipeRepository.getRecipe("ingredient"))
          .thenAnswer((_) async => Right(mockRecipe));

      await recipeNotifier.getRecipeList(ingredient: "ingredient");

      expect(recipeNotifier.state, isA<Empty>());
    });

    test('Should update state to error when recipe data fetch fails', () async {
      when(() => mockRecipeRepository.getRecipe("ingredient"))
          .thenAnswer((_) async => Left(Failure(message: "Error encountered")));

      await recipeNotifier.getRecipeList(ingredient: "ingredient");

      expect(recipeNotifier.state, isA<ErrorMessage>());
      expect(
          (recipeNotifier.state as ErrorMessage).message, "Error encountered");
    });
  });
}
