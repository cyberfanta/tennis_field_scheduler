import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/tools/stamp.dart';
import '../../common_widgets/background_templates/base_template.dart';
import '../../common_widgets/dialogs/close_app_dialog.dart';

class GetDatesView extends StatefulWidget {
  const GetDatesView({super.key});

  static const routeName = '/GetDatesView';

  @override
  State<GetDatesView> createState() => _GetDatesViewState();
}

class _GetDatesViewState extends State<GetDatesView> {
  String tag =
      GetDatesView.routeName.substring(1, GetDatesView.routeName.length);

  @override
  Widget build(BuildContext context) {
    return BaseTemplate(
      tag: tag,
      content: buildContent(),
      backActionsToDo: backActions,
    );
  }

  Widget buildContent() {
    return Text("Prueba");
  }

  Future<void> backActions() async {
    stamp(tag, "Button Pressed: \"Back\"",
        decoratorChar: " * ", extraLine: true);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CloseAppDialog(
          tag: tag,
          futureCallback: () async {
            SystemNavigator.pop();
          },
        );
      },
    );
  }
}
