import 'package:flutter/material.dart';

class GetDatesView extends StatefulWidget {
  const GetDatesView({super.key});

  static const routeName = '/GetDatesView';

  @override
  State<GetDatesView> createState() => _GetDatesViewState();
}

class _GetDatesViewState extends State<GetDatesView> {
  @override
  Widget build(BuildContext context) {
    Column viewList = const Column(
        mainAxisSize: MainAxisSize.min,
      children: [
        Placeholder(),
      ],
    );

    return viewList;
  }
}
