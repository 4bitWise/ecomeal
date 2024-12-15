import 'package:ecomeal/constants/enums.dart';
import 'package:ecomeal/constants/strings.dart';
import 'package:ecomeal/helpers/extensions/media_query.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';

import 'package:ecomeal/constants/assets.dart';
import 'package:ecomeal/viewmodels/budget/budget_viewmodel.dart';
import 'package:ecomeal/views/base.view.dart';

class BudgetView extends StatefulWidget {
  const BudgetView({super.key});

  @override
  State<BudgetView> createState() => _BudgetViewState();
}

class _BudgetViewState extends State<BudgetView> {

  @override
  Widget build(BuildContext context) {
    return BaseView<BudgetViewModel>(
      builder: (context, model, _) => SafeArea(
        child: Scaffold(
          body: Center(
            child: model.state == ViewModelState.busy
                ? const CircularProgressIndicator()
                : SizedBox(
                    height: context.screenHeight -
                        MediaQuery.of(context).viewInsets.bottom,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Card(
                          clipBehavior: Clip.none,
                          elevation: 10,
                          child: SizedBox(
                            height: context.screenWidth * 0.4,
                            width: context.screenWidth * 0.4,
                            child: Image(
                              image: ResizeImage(
                                const AssetImage(ImagePaths.appLogo),
                                width: (context.screenWidth * 0.4).toInt(),
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        // end Icon
                        Column(
                          children: [
                            const Text(
                              AppStrings.budgetInputLabel,
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(height: context.screenHeight * 0.04),
                            SizedBox(
                              width: context.screenWidth * 0.5,
                              child: SpinBox(
                                min: model.minimalBudget,
                                max: model.maximalBudget,
                                value: model.currentBudget,
                                step: 1,
                                decimals: 0,
                                onChanged: model.updateBudget,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        if (model.errorMsg != null)
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              model.errorMsg!,
                              style: const TextStyle(color: Colors.red),
                            ),
                          ),

                        Column(
                          children: [
                            SizedBox(
                              width: context.screenWidth * 0.7,
                              // height: context.screenHeight * 0.05,
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  children: [
                                    const TextSpan(
                                      text:
                                          'La liste de course sera générée dans la tranche allant de ',
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.black),
                                    ),
                                    TextSpan(
                                      text:
                                          '${model.lowerBound.toStringAsFixed(0)}€',
                                      style: const TextStyle(
                                          fontSize: 18, color: Colors.blue),
                                    ),
                                    const TextSpan(
                                      text: ' à ',
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.black),
                                    ),
                                    TextSpan(
                                      text:
                                          '${model.higherBound.toStringAsFixed(0)}€',
                                      style: const TextStyle(
                                          fontSize: 18, color: Colors.blue),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: context.screenHeight * 0.05),
                            ElevatedButton(
                              onPressed:
                                  (model.currentBudget >= model.minimalBudget)
                                      ? () async {
                                          await model.generateMealPlan(context);
                                        }
                                      : null,
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(context.screenWidth * 0.6,
                                    context.screenHeight * 0.05),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  side: const BorderSide(
                                      color: Colors.blue, width: 2),
                                ),
                                textStyle: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.blue,
                                ),
                              ),
                              child: const Text(
                                "Valider",
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
