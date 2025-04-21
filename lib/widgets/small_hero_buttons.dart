import 'package:flutter/material.dart';
import 'package:test_app/controllers/url_launch_controller.dart';
import 'package:test_app/core/utils/extensions.dart';
import 'package:test_app/widgets/styled_button.dart';

class SmallHeroButtons extends StatelessWidget {
  const SmallHeroButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: PrimaryButton(
            onPressed: () {
              UrlLaunchController.launchWeb(
                "https://drive.google.com/drive/folders/1AFYtDx-oMHkBQkNeGzMCxN-Alr5nLJd8",
              );
            },
            title: context.texts.downloadResume,
          ),
        ),
        20.toHeight,
        SizedBox(
          width: double.infinity,
          child: OutlineButton(
            onPressed: () {
              UrlLaunchController.sendMail("gideon.dart@gmail.com");
            },
            title: context.texts.contactMe,
          ),
        ),
      ],
    );
  }
}
