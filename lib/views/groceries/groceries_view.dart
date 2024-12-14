import 'package:ecomeal/viewmodels/groceries/groceries_viewmodel.dart';
import 'package:ecomeal/views/base.view.dart';
import 'package:flutter/material.dart';

class GroceriesView extends StatefulWidget {
  const GroceriesView({super.key});

  @override
  State<GroceriesView> createState() => _GroceriesViewState();
}

class _GroceriesViewState extends State<GroceriesView> {
  @override
  Widget build(BuildContext context) {
    double total = 0;
    return BaseView<GrooceriesViewModel>(
      onModelReady: (model) {
        total = model.ingredients.fold(0, (sum, item) => sum + item.price!);
        model.checkRecord = List.filled(model.ingredients.length, false);
      },
      builder: (context, model, _) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: ListView(
            children: [
              ...List.generate(model.ingredients.length, (int index) {
                return Row(
                  children: [
                    Checkbox(
                      value: model.checkRecord[index],
                      onChanged: (value) {
                        model.updateCheckBox(index, value);
                      },
                    ),
                    Text(
                      '${model.getIngredientName(index)} - ${model.ingredients[index].quantity}${model.getUnitFromIndex(index)}',
                    ),
                    const Spacer(),
                    Text(
                        '${model.ingredients[index].price!.toStringAsFixed(2)}€'),
                  ],
                );
              }),
              Row(
                children: [
                  const Text('Total prévu'),
                  const Spacer(),
                  Text('${total.toStringAsFixed(2)}€'),
                ],
              ),
              const SizedBox(
                height: 40,
              )
            ],
          ),
        );
      },
    );
  }
}
