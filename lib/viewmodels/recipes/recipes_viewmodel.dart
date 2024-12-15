import 'package:ecomeal/app_locator.dart';
import 'package:ecomeal/models/recipe_model.dart';
import 'package:ecomeal/services/recipes/recipes_service.dart';
import 'package:ecomeal/viewmodels/base.viewmodel.dart';

class RecipeData {
  final Recipe recipe;
  int count = 1;
  RecipeData({required this.recipe});

  void increment() {
    count++;
  }
}

class RecipesViewModel extends BaseViewModel {
  List<Recipe> get recipes => locator<RecipeService>().recipes;
  Map<String, RecipeData> data = {};

  void processRecipes() {
    for (var recipe in recipes) {
      if (data.containsKey(recipe.id)) {
        data[recipe.id]!.increment();
      } else {
        data[recipe.id] = RecipeData(recipe: recipe);
      }
    }
  }
}
