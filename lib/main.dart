import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tennis_field_scheduler/presentation/views/screens/add_dates_view.dart';
import 'package:tennis_field_scheduler/presentation/views/screens/get_dates_view.dart';

import 'core/constants/ui_text_delegate.dart';
import 'data/repositories/repository.dart';
import 'domain/presenters/screens/reserved_date_cubit.dart';

Future<void> main() async {
  // ignore: unused_local_variable
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

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

    return BlocProvider(
      create: (context) => ReservedDateCubit(Repository()),
      child: MaterialApp(
        initialRoute: GetDatesView.routeName,
        routes: {
          // Views
          GetDatesView.routeName: (context) => const GetDatesView(),
          AddDatesView.routeName: (context) => const AddDatesView(),
        },
        localizationsDelegates: const [
          UxTextDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', 'US'), // English
          Locale('es', 'ES'), // Spanish
        ],
      ),
    );
  }
}
