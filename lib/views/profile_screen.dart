import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:test_app/core/utils/extensions.dart';
import 'package:test_app/widgets/hero_widget.dart';
import 'package:test_app/widgets/professions_list.dart';
import 'package:test_app/widgets/profile_screen_background_blur.dart';

class ProfileScreen extends StatefulWidget {
  final int currentScreenIndex;
  const ProfileScreen({super.key, required this.currentScreenIndex});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    scrollController.addListener(_scrollListener);
    super.initState();
  }

  //================ Controllers =================\\
  var scrollController = ScrollController();

  //================ Booleans =================\\
  var scrollToTopBtnVisible = false;

  //================ Scroll Listener =================//
  void _scrollListener() {
    //========= Show action button ========//
    if (scrollController.position.pixels >= 100) {
      setState(() {
        scrollToTopBtnVisible = true;
      });
    }
    //========= Hide action button ========//
    else if (scrollController.position.pixels < 100) {
      setState(() {
        scrollToTopBtnVisible = false;
      });
    }
  }

  //================ Scroll to Top =================//
  void scrollToTop() => scrollController.animateTo(
    0,
    duration: const Duration(seconds: 1),
    curve: Curves.fastOutSlowIn,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:
          scrollToTopBtnVisible
              ? Padding(
                padding: EdgeInsets.only(bottom: 80),
                child: FloatingActionButton.small(
                  onPressed: scrollToTop,
                  backgroundColor: context.colorScheme.primary,
                  tooltip: "Scroll to top",
                  enableFeedback: true,
                  focusColor: context.colorScheme.primary,
                  hoverColor: context.colorScheme.primary,
                  foregroundColor: Colors.white,
                  child: const Icon(Icons.keyboard_arrow_up),
                ).fadeInUp(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                ),
              )
              : const SizedBox(),
      body: Stack(
        children: [
          ProfileScreenBackgroundBlur(),
          Scrollbar(
            child: SingleChildScrollView(
              controller: scrollController,
              padding: const EdgeInsets.only(
                top: 10,
                left: 10,
                right: 10,
                bottom: 120,
              ),
              child: Column(children: [HeroWidget(), ProfessionsList()]),
            ),
          ),
        ],
      ),
    );
  }
}
