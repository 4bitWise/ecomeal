import 'package:ecomeal/app_locator.dart';
import 'package:ecomeal/constants/api.dart';
import 'package:ecomeal/models/recipe_model.dart';
import 'package:ecomeal/services/api/api_service.dart';
import 'package:ecomeal/services/base.service.dart';

class RecipeService extends BaseService {
  RecipeService();

  Future<List<Recipe>> getRecipes() async {
    try {
      final response = await locator<ApiService>()
          .getRequest(ApiConstants.generateRecipesEndpoint);
      final data = response.data;
      final List<Recipe> recipes = [];

      if (response.statusCode != 200) {
        throw Exception("Unable to fetch recipes");
      }

      for (var recipe in data) {
        recipes.add(Recipe.fromJson(recipe));
      }
      return recipes;
    } catch (e) {
      rethrow;
    }
  }
}
