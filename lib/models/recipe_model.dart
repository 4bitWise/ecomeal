import 'package:ecomeal/models/ingredient_model.dart';

import 'base.model.dart';

class Recipe implements BaseModel {
  String? id;
  String? name;
  double? preparationTime;
  double? servings;
  List<Ingredient>? ingredients;
  List<String>? instructions;

  Recipe({
    this.id,
    this.name,
    this.preparationTime,
    this.servings,
    this.ingredients,
    this.instructions,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "preparation_time": preparationTime,
        "servings": servings,
        "ingredients": ingredients,
        "instructions": instructions
      };

  factory Recipe.fromJson(Map<String, dynamic> json) {
    try {
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
              .toList());
    } catch (e) {
      throw Exception(e);
    }
  }
}
