import 'package:ecomeal/app_locator.dart';
import 'package:ecomeal/constants/enums.dart';
import 'package:ecomeal/constants/routes.dart';
import 'package:ecomeal/services/recipes/recipes_service.dart';
import 'package:ecomeal/viewmodels/base.viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class BudgetViewModel extends BaseViewModel {
  double currentBudget = 50; // 100 by default
  final double minimalBudget = 50;
  final double maximalBudget = 10000;

  String? errorMsg;

  void updateBudget(double value) {
    currentBudget = value;
    if (value < minimalBudget) {
      errorMsg = 'Minimum 50 €';
    } else {
      errorMsg = null;
    }
    setState(ViewModelState.idle);
  }

  double get lowerBound => currentBudget - (currentBudget * 0.10);
  double get higherBound => currentBudget + (currentBudget * 0.10);

  Future<void> generateMealPlan(BuildContext ctx) async {
    setState(ViewModelState.busy);
    try {
      await locator<RecipeService>().generateRecipes(currentBudget);
      await locator<RecipeService>().generateIngredientsFromRecipes(
        locator<RecipeService>().recipes.map((recipe) => recipe.id).toList(),
      );

      Navigator.pushNamed(ctx, RoutePaths.home);
    } catch (e) {
      locator<Logger>().e(e);
    }
    setState(ViewModelState.idle);
  }
}
