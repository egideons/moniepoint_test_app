import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_app/views/screen_content.dart';
import 'package:test_app/widgets/animated_dialog.dart';
import 'package:test_app/widgets/custom_bottom_navgiation.dart';
import 'package:test_app/widgets/exit_app_dialog.dart';

class CustomNavigationScreen extends StatefulWidget {
  const CustomNavigationScreen({super.key});

  @override
  State<CustomNavigationScreen> createState() => _CustomNavigationScreenState();
}

class _CustomNavigationScreenState extends State<CustomNavigationScreen> {
  int currentIndex = 2;

  void _handleBackNavigation() async {
    if (currentIndex == 2) {
      final shouldExit = await showAnimatedDialog<bool>(
        context: context,
        barrierDismissible: true,
        child: const ExitAppDialog(),
      );

      if (shouldExit == true && mounted) {
        SystemNavigator.pop();
      }
    } else {
      if (mounted) {
        setState(() => currentIndex = 2);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          _handleBackNavigation();
        }
      },

      child: Scaffold(
        body: Stack(
          children: [
            ScreenContent(currentScreenIndex: currentIndex),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              bottom: 20,
              right: 40,
              left: 40,
              child: CustomBottomNavigation(
                currentIndex: currentIndex,
                onIndexChanged: (index) {
                  setState(() => currentIndex = index);
                },
              ).slideUp(
                duration: const Duration(seconds: 3),
                curve: Curves.easeInOut,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
