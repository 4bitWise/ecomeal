import 'package:ecomeal/viewmodels/home/home_viewmodel.dart';
import 'package:ecomeal/views/base.view.dart';
import 'package:ecomeal/views/groceries/groceries_view.dart';
import 'package:ecomeal/views/recipes/recipes_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      builder: (context, model, _) => SafeArea(
        child: Scaffold(
          appBar: AppBar(),
          body: const DefaultTabController(
            length: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                TabBar(
                  tabs: [
                    Tab(icon: Icon(Icons.ramen_dining)),
                    Tab(icon: Icon(Icons.apple)),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      RecipesView(),
                      GroceriesView(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
