import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecomeal/helpers/extensions/theme.dart';
import 'package:ecomeal/theme/sizes.dart';
import 'package:flutter/material.dart';

class CustomElevatedCard extends StatelessWidget {
  final String recipe;
  final String imageUrl;
  // final double price;
  final int personsNb;
  final double cookingTimeInMins;
  final List<String> instructions;

  // final VoidCallback onTap;

  const CustomElevatedCard(
      {super.key,
      required this.recipe,
      required this.imageUrl,
      // required this.price,
      required this.personsNb,
      required this.cookingTimeInMins,
      required this.instructions});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {_showInstructions(context)},
      child: SizedBox(
        width: 170,
        height: 220,
        child: Card(
            margin: const EdgeInsets.symmetric(horizontal: Spacing.small),
            elevation: 2,
            clipBehavior: Clip.antiAlias,
            shadowColor: Colors.grey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 100,
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    fit: BoxFit.contain,
                  ),
                ),
                const Divider(),
                const SizedBox(height: Spacing.x2Small),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    recipe,
                    style: context.titleSmall!.copyWith(color: Colors.black),
                    softWrap: true,
                    textAlign: TextAlign.center,
                  ),
                ),

                // const SizedBox(height: Spacing.xSmall),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
                //   child: Text(
                //     "Prix: $price€",
                //     style: context.bodyMedium!.copyWith(
                //       color: Colors.black
                //     ),
                //     softWrap: false,
                //   ),
                // ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    "Personnes: $personsNb",
                    style: context.bodyMedium!.copyWith(color: Colors.black),
                    softWrap: false,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    "Préparation: $cookingTimeInMins mins",
                    style: context.bodyMedium!.copyWith(color: Colors.black),
                    softWrap: false,
                  ),
                ),
              ],
            )),
      ),
    );
  }

  void _showInstructions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(recipe, style: context.headlineMedium),
                const SizedBox(height: 10),
                ...instructions.map((instruction) => Text("• $instruction")),
              ],
            ),
          ),
        );
      },
    );
  }
}
