import 'package:ecomeal/app_locator.dart';
import 'package:ecomeal/constants/enums.dart';
import 'package:ecomeal/models/recipe_model.dart';
import 'package:ecomeal/services/recipes/recipes_service.dart';
import 'package:ecomeal/viewmodels/base.viewmodel.dart';

class RecipesViewModel extends BaseViewModel {
  List<Recipe> recipes = [];

  Future<void> fetchRecipes() async {
    setState(ViewModelState.busy);
    recipes = await locator<RecipeService>().getRecipes();
    setState(ViewModelState.idle);
  }
}
