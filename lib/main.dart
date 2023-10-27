import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'presentation/views/screens/get_dates_view.dart';

Future<void> main() async {
  // ignore: unused_local_variable
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // await firebase();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // FlutterNativeSplash.remove();

    return MaterialApp(
      initialRoute: GetDatesView.routeName,
      routes: {
        // GetDatesView
        GetDatesView.routeName: (context) => const GetDatesView(),
      },
    );
  }
}
