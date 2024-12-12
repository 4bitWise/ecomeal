import 'package:ecomeal/constants/enums.dart';
import 'package:ecomeal/viewmodels/base.viewmodel.dart';

class BudgetViewModel extends BaseViewModel {
  double currentBudget = 100; // 100 by default
  final double minimalBudget = 50;
  final double maximalBudget = 10000;

  String? errorMsg;

  void updateBudget(double value) {
    setState(ViewModelState.busy);
    currentBudget = value;
    if (value < minimalBudget) {
      errorMsg = 'Minimum 50 €';
    } else {
      errorMsg = null;
    }
    setState(ViewModelState.idle);
  }

  double get lowerBound => currentBudget - (currentBudget * 0.10);
  double get higherBound => currentBudget + (currentBudget * 0.10);

  // get Lowerbound
  // get higherBound
}
