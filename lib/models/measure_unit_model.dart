import 'package:ecomeal/constants/enums.dart';

import 'base.model.dart';

class MeasureUnit implements BaseModel {
  String id;
  String unitName;
  String unitSymbol;
  UnitType measurementType;
  double conversionFactor;
  String? baseUnitId;

  MeasureUnit({
    required this.id,
    required this.unitName,
    required this.unitSymbol,
    required this.measurementType,
    required this.conversionFactor,
    this.baseUnitId,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "unit_name": unitName,
        "unit_symbol": unitSymbol,
        "measurement_type":
            measurementType == UnitType.weight ? "weight" : "volume",
        "conversion_factor": conversionFactor,
        "base_unit_id": baseUnitId
      };

  factory MeasureUnit.fromJson(Map<String, dynamic> json) {
    String mType = (json['measurement_type'] as String);

    return MeasureUnit(
      id: json['id'] as String,
      unitName: json['unit_name'] as String,
      unitSymbol: json['unit_symbol'] as String,
      measurementType: mType == "weight" ? UnitType.weight : UnitType.volume,
      conversionFactor: (json['conversion_factor'] as num).toDouble(),
      baseUnitId: json['base_unit_id'] as String?,
    );
  }
}
