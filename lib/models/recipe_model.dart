import 'package:ecomeal/models/ingredient_model.dart';
import 'base.model.dart';

class Recipe implements BaseModel {
  String id;
  String name;
  double preparationTime;
  double servings;
  List<Ingredient> ingredients;
  List<String> instructions;
  double cost;

  Recipe({
    required this.id,
    required this.name,
    required this.preparationTime,
    required this.servings,
    required this.ingredients,
    required this.instructions,
    required this.cost,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "preparation_time": preparationTime,
        "servings": servings,
        "ingredients": ingredients,
        "instructions": instructions,
        "cost": cost,
      };

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'] as String,
      name: json['name'] as String,
      preparationTime: (json['preparation_time'] as num).toDouble(),
      servings: (json['servings'] as num).toDouble(),
      ingredients: (json['ingredients'] as List<dynamic>)
          .map((item) => Ingredient.fromJson(item as Map<String, dynamic>))
          .toList(),
      instructions: (json['instructions'] as List<dynamic>)
          .map((item) => item as String)
          .toList(),
      cost: json['cost'] as double,
    );
  }
}
