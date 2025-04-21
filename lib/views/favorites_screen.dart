import 'package:flutter/material.dart';

class FavoritesScreen extends StatefulWidget {
  final int currentScreenIndex;
  const FavoritesScreen({super.key, required this.currentScreenIndex});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Screen ${widget.currentScreenIndex}")),
    );
  }
}
