import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:smooth_counter/smooth_counter.dart';
import 'package:test_app/core/utils/app_images.dart';
import 'package:test_app/core/utils/app_sizing.dart';
import 'package:test_app/core/utils/extensions.dart';
import 'package:test_app/widgets/hero_image.dart';
import 'package:test_app/widgets/hero_texts.dart';
import 'package:test_app/widgets/small_hero_buttons.dart';

class HeroWidget extends StatelessWidget {
  const HeroWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Insets.med,
        vertical: Insets.xxxl,
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(250)),
                child: Image.asset(
                  AppImages.flutter,
                  height: 32,
                  width: 32,
                  fit: BoxFit.contain,
                ),
              ),
              Text(context.texts.poweredByFlutter),
            ],
          ).fadeInDownBig(curve: Curves.easeIn),
          _SmallHero(),
        ],
      ),
    );
  }
}

class _SmallHero extends StatelessWidget {
  const _SmallHero();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 140),
          child: HeroImage().fadeInDownBig(curve: Curves.easeIn),
        ),
        20.toHeight,
        HeroTexts().fadeInUpBig(curve: Curves.easeIn),
        40.toHeight,
        SmallHeroButtons().fadeInUpBig(curve: Curves.easeIn),
        20.toHeight,
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: context.width),
          child: _HeroWorkSummary(),
        ),
      ],
    );
  }
}

class _HeroWorkSummary extends StatefulWidget {
  const _HeroWorkSummary();

  @override
  State<_HeroWorkSummary> createState() => __HeroWorkSummaryState();
}

class __HeroWorkSummaryState extends State<_HeroWorkSummary> {
  final _yearsOfWorkExperience = SmoothCounterController(
    duration: const Duration(milliseconds: 1000),
  );
  final _projectsWorkedOn = SmoothCounterController(
    duration: const Duration(milliseconds: 1000),
  );
  final _companiesWorkedAt = SmoothCounterController(
    duration: const Duration(milliseconds: 1000),
  );

  @override
  void initState() {
    _incrementCounter();
    super.initState();
  }

  @override
  void dispose() {
    _yearsOfWorkExperience.dispose();
    super.dispose();
  }

  void _incrementCounter() async {
    await Future.delayed(const Duration(seconds: 2)).then((value) {
      _yearsOfWorkExperience.count += 5;
      _projectsWorkedOn.count += 12;
      _companiesWorkedAt.count += 5;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: _rowItem(
            controller: _yearsOfWorkExperience,
            hasSuffix: true,
            subtitle: context.texts.yearsOfWorkExperience,
          ),
        ),
        Expanded(
          child: _rowItem(
            controller: _projectsWorkedOn,
            hasSuffix: true,
            subtitle: context.texts.projectsWorkedOn,
          ),
        ),
        Expanded(
          child: _rowItem(
            controller: _companiesWorkedAt,
            hasSuffix: false,
            subtitle: context.texts.companiesWorkedAt,
          ),
        ),
      ],
    );
  }

  _rowItem({
    SmoothCounterController? controller,
    String? subtitle,
    bool? hasSuffix,
  }) => Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisSize: MainAxisSize.min,
    children: [
      SmoothCounter(
        controller: controller,
        suffix: hasSuffix == true ? "+" : "",
        textStyle: context.textStyle.titleLgBold,
        curve: Curves.easeIn,
        duration: Duration(milliseconds: 500),
      ),
      Text(
        subtitle ?? "",
        textAlign: TextAlign.center,
        style: context.textStyle.titleMdMedium,
      ),
    ],
  );
}
