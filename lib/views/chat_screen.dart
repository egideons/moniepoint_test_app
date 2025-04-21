import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final int currentScreenIndex;
  const ChatScreen({super.key, required this.currentScreenIndex});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Screen ${widget.currentScreenIndex}")),
    );
  }
}
