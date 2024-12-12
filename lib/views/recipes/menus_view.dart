import 'package:ecomeal/app_locator.dart';
import 'package:ecomeal/views/recipes/widgets/elevated_card.dart';
import 'package:ecomeal/theme/sizes.dart';
import 'package:ecomeal/viewmodels/recipes/recipes_viewmodel.dart';
import 'package:ecomeal/views/base.view.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class RecipesView extends StatefulWidget {
  const RecipesView({super.key});

  @override
  State<RecipesView> createState() => _RecipesViewState();
}

class _RecipesViewState extends State<RecipesView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<RecipesViewModel>(
      onModelReady: (model) async {
        await model.fetchRecipes();
        locator<Logger>().i(model.recipes);
      },
      builder: (context, model, _) => Scaffold(
        body: GridView.count(
          mainAxisSpacing: Spacing.medium,
          crossAxisCount: 2,
          children: List.generate(model.recipes.length, (index) {
            return CustomElevatedCard(
              recipe: model.recipes[index].name!,
              imageUrl:
                  "https://cdn-icons-png.flaticon.com/256/6039/6039575.png",
              // price: 3.4,
              personsNb: model.recipes[index].servings!.toInt(),
              cookingTimeInMins: model.recipes[index].preparationTime!,
              instructions: model.recipes[index].instructions!,
            );
          }),
        ),
      ),
    );
  }
}
