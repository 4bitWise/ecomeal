import 'base.model.dart';

class Ingredient implements BaseModel {
  String? ingredientId;
  String? unitId;
  double? quantity;

  Ingredient({
    this.ingredientId,
    this.unitId,
    this.quantity,
  });

  Map<String, dynamic> toJson() =>
      {"ingredient_id": ingredientId, "unit_id": unitId, "quantity": quantity};

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    try {
      return Ingredient(
        ingredientId: json['ingredient_id'] as String?,
        unitId: json['unit_id'] as String?,
        quantity: (json['quantity'] as num).toDouble(),
      );
    } catch (e) {
      throw Exception(e);
    }
  }
}
