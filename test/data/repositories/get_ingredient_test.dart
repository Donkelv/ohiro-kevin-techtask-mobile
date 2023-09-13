import 'package:mocktail/mocktail.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tech_task/data/repositories/get_ingredient.dart';
import 'package:tech_task/domain/entites/failure.dart';
import 'package:tech_task/domain/entites/ingredient.dart';
import 'package:tech_task/domain/repositories/recipe.dart';
import 'package:tech_task/presentation/state/ingredient_list_state.dart';

class MockRecipeRepository extends Mock implements BaseRecipeRepository {}

void main() {
  late MockRecipeRepository mockRecipeRepository;
  late ProviderContainer container;
  late GetIngredientNotifier ingredientNotifier;

  setUp(() {
    mockRecipeRepository = MockRecipeRepository();
    container = ProviderContainer();
    ingredientNotifier =
        GetIngredientNotifier(baseRecipeRepository: mockRecipeRepository);
  });

  tearDown(() {
    container.dispose();
  });

  group('GetIngredientNotifier', () {
    test('Should update state to loaded when ingredient data list is fetched',
        () async {
      List<IngredientEntity> mockIngredient = [
        IngredientEntity(title: "title", useBy: "useBy"),
      ];
      when(() => mockRecipeRepository.getIngredent())
          .thenAnswer((_) async => Right(mockIngredient));

      await ingredientNotifier.getIngredientList();

      expect(ingredientNotifier.state, isA<Loaded>());
      expect((ingredientNotifier.state as Loaded).data, mockIngredient);
    });

    test('Should update state to Empty when ingredient data list is empty',
        () async {
      List<IngredientEntity> emptyIngredient = <IngredientEntity>[];
      when(() => mockRecipeRepository.getIngredent())
          .thenAnswer((_) async => Right(emptyIngredient));

      await ingredientNotifier.getIngredientList();

      expect(ingredientNotifier.state, isA<Empty>());
    });

    test('Should update state to error when ingredient data list fetch fails',
        () async {
      when(() => mockRecipeRepository.getIngredent())
          .thenAnswer((_) async => Left(Failure(message: "Error encountered")));

      await ingredientNotifier.getIngredientList();

      expect(ingredientNotifier.state, isA<ErrorMessage>());
      expect((ingredientNotifier.state as ErrorMessage).message,
          "Error encountered");
    });
  });
}
