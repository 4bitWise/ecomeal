import 'package:ecomeal/app_locator.dart';
import 'package:ecomeal/constants/api.dart';
import 'package:ecomeal/models/measure_unit_model.dart';
import 'package:ecomeal/services/api/api_service.dart';
import 'package:ecomeal/services/base.service.dart';
import 'package:logger/logger.dart';

class MeasureUnitService extends BaseService {
  MeasureUnitService();

  Map<String, MeasureUnit>? units;

  Future<void> fetchUnits() async {
    try {
      final response =
          await locator<ApiService>().getRequest(ApiConstants.getAllUnits);

      if (response.statusCode != 200) {
        throw Exception("Unable to fetch measueUnits");
      }
      units = {};
      for (var unit in response.data) {
        units![unit["id"]] = MeasureUnit.fromJson(unit);
      }
    } catch (e) {
      locator<Logger>().e(e);
    }
  }
}
