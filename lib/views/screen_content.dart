import 'package:flutter/material.dart';
import 'package:test_app/views/chat_screen.dart';
import 'package:test_app/views/favorites_screen.dart';
import 'package:test_app/views/home_screen.dart';
import 'package:test_app/views/profile_screen.dart';
import 'package:test_app/views/search_screen.dart';

class ScreenContent extends StatelessWidget {
  final int currentScreenIndex;
  const ScreenContent({super.key, required this.currentScreenIndex});

  @override
  Widget build(BuildContext context) {
    switch (currentScreenIndex) {
      case 0:
        return SearchScreen();
      case 1:
        return ChatScreen(currentScreenIndex: currentScreenIndex);
      case 2:
        return HomeScreen();
      case 3:
        return FavoritesScreen(currentScreenIndex: currentScreenIndex);
      case 4:
        return ProfileScreen(currentScreenIndex: currentScreenIndex);
      default:
        return HomeScreen();
    }
  }
}
