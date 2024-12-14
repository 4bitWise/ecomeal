import 'package:ecomeal/app_locator.dart';
import 'package:ecomeal/constants/api.dart';
import 'package:ecomeal/models/ingredient_model.dart';
import 'package:ecomeal/models/recipe_model.dart';
import 'package:ecomeal/services/api/api_service.dart';
import 'package:ecomeal/services/base.service.dart';
import 'package:logger/logger.dart';

class RecipeService extends BaseService {
  RecipeService();
  List<Recipe> recipes = [];
  List<Ingredient> ingredients = [];

  Future<void> generateRecipes(double budget) async {
    try {
      recipes = [];
      final response = await locator<ApiService>().getRequest(
        ApiConstants.generateRecipesEndpoint,
        data: {
          "budget": budget.toInt(),
        },
      );

      if (response.statusCode != 200) {
        throw Exception("Unable to fetch recipes");
      }
      for (var recipe in response.data) {
        recipes.add(Recipe.fromJson(recipe));
      }
    } catch (e) {
      locator<Logger>().e(e);
      recipes = [];
    }
  }

  Future<void> generateIngredientsFromRecipes(List<String> recipeIds) async {
    try {
      ingredients = [];

      final response = await locator<ApiService>().getRequest(
        ApiConstants.getIngredientsFromRecipeEndPoint,
        data: {
          "recipes": recipeIds,
        },
      );

      if (response.statusCode != 200) {
        throw Exception("Unable to fetch ingredients");
      }

      for (var ingredient in response.data) {
        ingredients.add(Ingredient.fromJson(ingredient));
      }
    } catch (e) {
      locator<Logger>().e(e);
      ingredients = [];
    }
  }
}
