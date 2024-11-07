import 'package:ecomeal/common/elevated_card.dart';
import 'package:ecomeal/theme/sizes.dart';
import 'package:ecomeal/viewmodels/startup/startup_viewmodel.dart';
import 'package:ecomeal/views/base.view.dart';
import 'package:flutter/material.dart';

class StartupView extends StatefulWidget {
  const StartupView({
    super.key
  });

  @override
  State<StartupView> createState() => _StartupViewState();
}

class _StartupViewState extends State<StartupView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<StartupViewModel>(
      onModelReady: (model) {
      },
      builder: (context, model, _) => Scaffold(
        body: GridView.count(
          mainAxisSpacing: Spacing.medium,
          crossAxisCount: 2,
          children: List.generate(100, (index) {
            return const CustomElevatedCard(
              recipe: "Risotto aux légumes",
              imageUrl: "https://cdn-icons-png.flaticon.com/256/6039/6039575.png",
              price: 3.4,
              personsNb: 1,
              cookingTimeInMins: 10,
            );
          }),
        ),
      ),
    );
  }
}