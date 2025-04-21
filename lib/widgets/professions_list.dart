import 'package:flutter/material.dart';
import 'package:test_app/core/utils/app_images.dart';
import 'package:test_app/core/utils/extensions.dart';
import 'package:test_app/widgets/profession_card_item.dart';

class ProfessionsList extends StatelessWidget {
  const ProfessionsList({super.key});

  @override
  Widget build(BuildContext context) {
    return _ProfessionListMobileView();
  }
}

class _ProfessionListMobileView extends StatefulWidget {
  const _ProfessionListMobileView();

  @override
  State<_ProfessionListMobileView> createState() =>
      _ProfessionListMobileViewState();
}

class _ProfessionListMobileViewState extends State<_ProfessionListMobileView> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_options.isEmpty) {
      _options = [
        {"title": context.texts.leader, "icon": AppImages.leader},
        {"title": context.texts.mobileAppDeveloper, "icon": AppImages.mobile},
        {"title": context.texts.frontendWebDeveloper, "icon": AppImages.web},
        {"title": context.texts.graphicDesigner, "icon": AppImages.designer},
      ];
    }
  }

  List<Map<String, dynamic>> _options = [];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.separated(
        itemCount: _options.length,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => 20.toWidth,
        itemBuilder: (context, index) {
          final option = _options[index];
          return ProfessionCardItem(
            title: option["title"],
            imagePath: option["icon"],
          );
        },
      ),
    );
  }
}
