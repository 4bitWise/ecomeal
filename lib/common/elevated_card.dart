import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecomeal/helpers/extensions/theme.dart';
import 'package:ecomeal/theme/colors.dart';
import 'package:ecomeal/theme/sizes.dart';
import 'package:flutter/material.dart';

class CustomElevatedCard extends StatelessWidget {
  // final String label;
  // final String imageUrl;
  // final String description;
  // final VoidCallback onTap;

  const CustomElevatedCard({
    super.key,
    // required this.label,
    // required this.imageUrl,
    // required this.description,
    // required this.onTap
  });

  @override
  Widget build(BuildContext context){
    return Container(
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
                imageUrl: "https://cdn-icons-png.flaticon.com/256/6039/6039575.png",
                fit: BoxFit.contain,
              ),
            ),
            const Divider(),
            const SizedBox(height: Spacing.x2Small),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                "Risotto aux légumes",
                style: context.titleSmall!.copyWith(
                  color: Colors.black
                ),
                softWrap: true,
                textAlign: TextAlign.center,
              ),
            ),

            const SizedBox(height: Spacing.xSmall),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                "Prix: 3.4€",
                style: context.bodyMedium!.copyWith(
                  color: Colors.black
                ),
                softWrap: false,
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                "Personnes: 1",
                style: context.bodyMedium!.copyWith(
                  color: Colors.black
                ),
                softWrap: false,
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                "Préparation: 10mins",
                style: context.bodyMedium!.copyWith(
                  color: Colors.black
                ),
                softWrap: false,
              ),
            ),
          ],
        )
      ),
    );
  }
}