// ignore_for_file: deprecated_member_use

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tennis_field_scheduler/core/constants/ui_text_delegate.dart';
import 'package:tennis_field_scheduler/core/tools/stamp.dart';
import 'package:tennis_field_scheduler/data/repositories/repository.dart';
import 'package:tennis_field_scheduler/domain/presenters/screens/reserved_date_cubit.dart';
import 'package:tennis_field_scheduler/domain/presenters/screens/weather_forecast_cubit.dart';
import 'package:tennis_field_scheduler/presentation/views/screens/add_dates_view.dart';
import 'package:tennis_field_scheduler/presentation/views/screens/get_dates_view.dart';

String tag = "UnitTest";

List<Widget> views = [
  const GetDatesView(),
  const AddDatesView(),
];

List<TargetPlatform> targetPlatformTest = [
  TargetPlatform.iOS,
  TargetPlatform.android
];

List<List<Size>> sizesTest = [
  [
    const Size(320, 480),
    const Size(408, 886),
    const Size(428, 926),
    const Size(1284, 2778),
    const Size(480, 320),
    const Size(886, 408),
    const Size(926, 428),
    const Size(2778, 1284),
  ],
  [
    const Size(340, 740),
    const Size(360, 740),
    const Size(360, 780),
    const Size(1080, 1800),
    const Size(1080, 1920),
    const Size(1080, 2340),
    const Size(1284, 2778),
    const Size(740, 340),
    const Size(740, 360),
    const Size(780, 360),
    const Size(1800, 1080),
    const Size(1920, 1080),
    const Size(2340, 1080),
    const Size(2778, 1284),
  ]
];

void main() {
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized();

  Widget makeTestWidget({required Widget child, required Size size}) {
    return MaterialApp(
      home: MediaQuery(
        data: MediaQueryData(size: size),
        child: child,
      ),
    );
  }

  for (Widget view in views) {
    group("View: ${view.toString()}", () {
      int i = 0;
      for (TargetPlatform targetPlatform in targetPlatformTest) {
        group("TargetPlatform: ${targetPlatform.toString()}", () {
          for (Size sizesTest in sizesTest[i]) {
            testWidgets(
                "Basic Overflow: Size: (${sizesTest.width}, ${sizesTest.height})",
                (tester) async {
              binding.window.physicalSizeTestValue = sizesTest;
              binding.window.devicePixelRatioTestValue = 1.0;
              debugDefaultTargetPlatformOverride = targetPlatform;

              await tester.runAsync(() async {
                stamp(tag,
                    "View: ${view.toString()} - Size: (${sizesTest.width}, ${sizesTest.height}) - Aspect Radio: ${sizesTest.height / sizesTest.width}) - TargetPlatform: ${targetPlatform.toString()}");

                await tester.pumpWidget(
                  MultiBlocProvider(
                    providers: [
                      BlocProvider<ReservedDateCubit>(
                        create: (context) => ReservedDateCubit(Repository()),
                      ),
                      BlocProvider<WeatherForecastCubit>(
                        create: (context) => WeatherForecastCubit(Repository()),
                      ),
                    ],
                    child: ViewToTest(
                      view: makeTestWidget(child: view, size: sizesTest),
                    ),
                  ),
                );

                expect(find.byWidget(view), findsOneWidget);
              });

              addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
              debugDefaultTargetPlatformOverride = null;
              await tester.pumpAndSettle();
            });
          }
          i++;
        });
      }
    });
  }
}

class ViewToTest extends StatelessWidget {
  const ViewToTest({
    super.key,
    required this.view,
  });

  final Widget view;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        UiTextDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('es', 'ES'),
      ],
      home: view,
    );
  }
}
