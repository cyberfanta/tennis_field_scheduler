import 'package:flutter_test/flutter_test.dart';
import 'package:tennis_field_scheduler/core/tools/stamp.dart';
import 'package:tennis_field_scheduler/data/entities/forecast.dart';
import 'package:tennis_field_scheduler/data/entities/reserved_date.dart';

String tag = "UnitTest";

List<List<Object>> model = [
  [
    Forecast,
    Forecast.empty(),
    forecastFromJson(Forecast.empty().toString()),
  ],
  [
    ReservedDate,
    ReservedDate.empty(),
    reservedDateFromJson(ReservedDate.empty().toString()),
  ],
];

void main() {
  for (int i = 0; i < model.length; i++) {
    group("Model: ${model[i][0].toString()}", () {
      stamp(model[i][0].toString(),
          "Def.Ins.[$i]: ${model[i][1]} - ${(model[i][1].runtimeType == model[i][0]) ? "OK" : "NO OK"}");
      stamp(model[i][0].toString(),
          "toString[$i]: ${model[i][2]} - ${(model[i][2].runtimeType == model[i][0]) ? "OK" : "NO OK"}\n\n");

      testWidgets('Test - Def.Ins.', (WidgetTester tester) async {
        expect(model[i][1].runtimeType, model[i][0]);
      });

      testWidgets('Test - toString', (WidgetTester tester) async {
        expect(model[i][2].runtimeType, model[i][0]);
      });

      testWidgets('Control Test - Def.Ins. vs toString',
          (WidgetTester tester) async {
        expect(model[i][1].runtimeType, model[i][2].runtimeType);
      });
    });
  }
}
