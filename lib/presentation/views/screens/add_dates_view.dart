import 'package:flutter/material.dart';

import '../../../core/tools/stamp.dart';
import '../../common_widgets/background_templates/base_template.dart';

class AddDatesView extends StatefulWidget {
  const AddDatesView({super.key});

  static const routeName = '/AddDatesView';

  @override
  State<AddDatesView> createState() => _AddDatesViewState();
}

class _AddDatesViewState extends State<AddDatesView> {
  String tag =
      AddDatesView.routeName.substring(1, AddDatesView.routeName.length);

  @override
  Widget build(BuildContext context) {
    return BaseTemplate(
      tag: tag,
      content: buildContent(),
      backActionsToDo: backActions,
    );
  }

  Widget buildContent() {
    return const Text("Prueba");
  }

  Future<void> backActions() async {
    stamp(tag, "Button Pressed: \"Back\"",
        decoratorChar: " * ", extraLine: true);
  }
}
