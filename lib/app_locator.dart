import 'package:ecomeal/services/api/api_service.dart';
import 'package:ecomeal/services/measure_unit/measure_unit_service.dart';
import 'package:ecomeal/services/recipes/recipes_service.dart';
import 'package:ecomeal/viewmodels/budget/budget_viewmodel.dart';
import 'package:ecomeal/viewmodels/groceries/groceries_viewmodel.dart';
import 'package:ecomeal/viewmodels/home/home_viewmodel.dart';
import 'package:ecomeal/viewmodels/recipes/recipes_viewmodel.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

GetIt locator = GetIt.instance;

void registerServices() {
  locator.registerSingleton<ApiService>(ApiService());

  locator.registerSingleton<RecipeService>(RecipeService());
  locator.registerSingletonAsync<MeasureUnitService>(
    () async {
      MeasureUnitService service = MeasureUnitService();
      await service.fetchUnits();
      return service;
    },
  );
}

void registerViewModels() {
  locator.registerFactory<BudgetViewModel>(() => BudgetViewModel());
  locator.registerFactory<HomeViewModel>(() => HomeViewModel());
  locator.registerFactory<RecipesViewModel>(() => RecipesViewModel());
  locator.registerFactory<GrooceriesViewModel>(() => GrooceriesViewModel());
}

void registerProviders() {
  throw UnimplementedError();
}

Future<void> setupLocator() async {
  // register logger for dev
  locator.registerLazySingleton<Logger>(
    () => Logger(
      printer: PrettyPrinter(
        methodCount: 0,
        errorMethodCount: 5,
        lineLength: 100,
        colors: true,
      ),
    ),
  );

  registerServices();
  registerViewModels();
  // registerProviders();
  await locator.allReady();
}
