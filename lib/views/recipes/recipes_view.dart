import 'package:ecomeal/views/recipes/widgets/recipe_card.dart';
import 'package:ecomeal/theme/sizes.dart';
import 'package:ecomeal/viewmodels/recipes/recipes_viewmodel.dart';
import 'package:ecomeal/views/base.view.dart';
import 'package:flutter/material.dart';

class RecipesView extends StatefulWidget {
  const RecipesView({super.key});

  @override
  State<RecipesView> createState() => _RecipesViewState();
}

class _RecipesViewState extends State<RecipesView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<RecipesViewModel>(
      onModelReady: (model) {
        model.processRecipes();
      },
      builder: (context, model, _) => Padding(
        padding: const EdgeInsets.only(
          bottom: 8.0,
          left: 8.0,
          right: 8.0,
        ),
        child: GridView.count(
          mainAxisSpacing: Spacing.medium,
          crossAxisCount: 2,
          children: model.data.keys.map(
            (id) {
              return RecipeCard(
                recipe: model.data[id]!.recipe.name,
                repeat: model.data[id]!.count,
                imageUrl:
                    "https://cdn.prod.website-files.com/62e18da95149ec2ee0d87b5b/659718a86e0a8047118596ed_6560a1733dc1fe2e8021df64_thumbnail-655e11b5bd2fc.webp",
                // price: 3.4,
                personsNb: model.data[id]!.recipe.servings.toInt(),
                cookingTimeInMins: model.data[id]!.recipe.preparationTime,
                instructions: model.data[id]!.recipe.instructions,
                cost: model.data[id]!.recipe.cost,
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
