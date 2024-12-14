import 'base.model.dart';

class Ingredient implements BaseModel {
  String id;
  double quantity;
  String unitId;
  double? price;

  Ingredient({
    required this.id,
    required this.unitId,
    required this.quantity,
    this.price,
  });

  Map<String, dynamic> toJson() => {
        "ingredient_id": id,
        "unit_id": unitId,
        "quantity": quantity,
        "price": price
      };

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      id: json['ingredient_id'] as String,
      unitId: json['unit_id'] as String,
      quantity: (json['quantity'] as num).toDouble(),
      price: (json['price'] as num?)?.toDouble(),
    );
  }
}
