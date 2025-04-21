import 'dart:async';

import 'package:flutter/material.dart';
import 'package:test_app/core/utils/extensions.dart';
import 'package:typewrite_text/typewrite_text.dart';

class HeroTexts extends StatefulWidget {
  const HeroTexts({super.key});

  @override
  State<HeroTexts> createState() => _HeroTextsState();
}

class _HeroTextsState extends State<HeroTexts> {
  final List<String> names = [" Gideon", " Chimemerie", " Chukwuoma"];
  int _currentIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(milliseconds: 2000), (timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % names.length;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text.rich(
          TextSpan(
            children: [
              WidgetSpan(
                child: Text(
                  context.texts.intro,
                  textAlign: TextAlign.center,
                  style: context.textStyle.titleLgBold.copyWith(
                    color: context.colorScheme.onSurface,
                  ),
                ),
              ),
              WidgetSpan(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder: (child, animation) {
                    return FadeTransition(
                      opacity: animation,
                      child: SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(0.0, 0.3),
                          end: Offset.zero,
                        ).animate(animation),
                        child: child,
                      ),
                    );
                  },
                  child: Text(
                    names[_currentIndex],
                    key: ValueKey<String>(names[_currentIndex]),
                    textAlign: TextAlign.center,
                    style: context.textStyle.titleLgBold.copyWith(
                      color: context.colorScheme.primary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        10.toHeight,
        TypewriteText(
          linesOfText: [
            "${context.texts.leader}.",
            "${context.texts.mobileAppDeveloper}.",
            "${context.texts.frontendWebDeveloper}.",
            "${context.texts.graphicDesigner}.",
          ],
          cursorSymbol: "|",
          cursorColor: context.colorScheme.primary,
          cursorBlinkingDuration: Duration(milliseconds: 800),
          beforeAnimationDuration: Duration(milliseconds: 400),
          afterAnimationDuration: Duration(milliseconds: 400),
          infiniteLoop: true,
          textAlign:
              context.isDesktopOrTablet ? TextAlign.left : TextAlign.center,
          textStyle: context.textStyle.titleLgBold.copyWith(
            color: context.colorScheme.primary,
          ),
        ),
        10.toHeight,
        Text(
          context.texts.professionalSummary,
          textAlign:
              context.isDesktopOrTablet ? TextAlign.left : TextAlign.center,
          style: context.textStyle.bodyLgMedium.copyWith(
            color: context.colorScheme.onSurface,
          ),
        ),
      ],
    );
  }
}
