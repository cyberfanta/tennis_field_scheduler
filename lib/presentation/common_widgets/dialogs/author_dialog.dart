import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tennis_field_scheduler/presentation/common_widgets/ontap_wrapper.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/constants/ui_colors.dart';
import '../../../core/constants/ui_text_styles.dart';
import '../../../core/constants/ui_texts.dart';
import '../../../core/static_data/static_data.dart';
import '../../../core/tools/stamp.dart';

class AuthorDialog extends StatelessWidget {
  const AuthorDialog({
    super.key,
    required this.tag,
  });

  final String tag;

  @override
  Widget build(BuildContext context) {
    String pretend = "Author Dialog:";
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
        UiTexts.of(context)!.authorTitle,
        style: styleRegular(24, cWhite),
        textAlign: TextAlign.center,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Julio César León Anhuamán\nCaracas - Venezuela",
            style: styleRegular(16, cWhite),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          OnTapWrapper(
            widgetToWrap: SvgPicture.asset(
              "assets/images/linkedin.svg",
            ),
            actionsToDo: () async {
              final url = Uri.parse(authorLinkedin);

              if (await canLaunchUrl(url)) {
                await launchUrl(url);
              }
            },
          ),
        ],
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
                UiTexts.of(context)!.authorButton,
                style: styleBold(13, cBlue),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
