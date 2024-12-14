import 'package:ecomeal/app_locator.dart';
import 'package:ecomeal/constants/enums.dart';
import 'package:ecomeal/models/ingredient_model.dart';
import 'package:ecomeal/services/measure_unit/measure_unit_service.dart';
import 'package:ecomeal/services/recipes/recipes_service.dart';
import 'package:ecomeal/viewmodels/base.viewmodel.dart';

class GrooceriesViewModel extends BaseViewModel {
  List<bool> checkRecord = [];
  List<Ingredient> get ingredients => locator<RecipeService>().ingredients;

  void updateCheckBox(int index, bool? value) {
    checkRecord[index] = value!;
    setState(ViewModelState.idle);
  }

  String getUnitFromIndex(int index) {
    String? symbol = locator<MeasureUnitService>()
        .units?[ingredients[index].unitId]
        ?.unitSymbol;
    return symbol ?? "";
  }

  String getIngredientName(int index) {
    List<String> splitted = ingredients[index].id.split("_")..removeAt(0);
    return (splitted
        .map((str) => str[0].toUpperCase() + str.substring(1))
        .toList()
        .join(" "));
  }
}
