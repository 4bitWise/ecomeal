import 'package:ecomeal/app_locator.dart';
import 'package:ecomeal/models/recipe_model.dart';
import 'package:ecomeal/services/recipes/recipes_service.dart';
import 'package:ecomeal/viewmodels/base.viewmodel.dart';

class RecipesViewModel extends BaseViewModel {
  List<Recipe> get recipes => locator<RecipeService>().recipes;
}
