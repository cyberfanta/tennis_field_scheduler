import 'package:flutter/material.dart';
import 'package:tennis_field_scheduler/core/static_data/static_data.dart';

import '../../../core/constants/ui_colors.dart';
import '../../../core/constants/ui_text_styles.dart';
import '../../../core/constants/ui_texts.dart';
import '../../../core/tools/stamp.dart';

class LostReservedDateDialog extends StatelessWidget {
  const LostReservedDateDialog({
    super.key,
    required this.tag,
  });

  final String tag;

  @override
  Widget build(BuildContext context) {
    String pretend = "Lost Reserved Date Dialog:";
    stamp(tag, "$pretend \"Opened\"", decoratorChar: " * ");

    return AlertDialog(
      backgroundColor: cBlue,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        side: BorderSide(
          width: .5,
          color: cBlack,
        ),
      ),
      actionsOverflowAlignment: OverflowBarAlignment.center,
      title: Text(
        UiTexts.of(context)!.lostReservedTitle,
        style: styleRegular(24, cWhite),
        textAlign: TextAlign.center,
      ),
      content: Text(
        UiTexts.of(context)!.lostReservedContent,
        maxLines: 2,
        style: styleRegular(16, cWhite),
        textAlign: TextAlign.center,
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                stamp(tag, "$pretend \"Reserved Date Lost\"",
                    decoratorChar: " * ", extraLine: true);
                Navigator.pop(context);
                viewManager.pop(context);
              },
              style: ElevatedButton.styleFrom(
                side: const BorderSide(width: 1, color: cWhite),
                backgroundColor: cBlue,
                padding: EdgeInsets.zero,
                fixedSize: const Size(100, 30),
              ),
              child: Text(
                UiTexts.of(context)!.lostReservedButton1,
                style: styleRegular(12, cWhite),
              ),
            ),
            const SizedBox(width: 20),
            ElevatedButton(
              onPressed: () {
                stamp(tag, "$pretend \"Closed\"",
                    decoratorChar: " * ", extraLine: true);
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                side: const BorderSide(width: 1.5, color: cBlack),
                backgroundColor: cBackground,
                padding: EdgeInsets.zero,
                fixedSize: const Size(100, 30),
              ),
              child: Text(
                UiTexts.of(context)!.lostReservedButton2,
                style: styleBold(13, cBlue),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
