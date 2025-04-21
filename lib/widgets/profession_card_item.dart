// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:test_app/core/utils/extensions.dart';

class ProfessionCardItem extends StatefulWidget {
  final String imagePath, title;
  const ProfessionCardItem({
    super.key,
    required this.imagePath,
    required this.title,
  });

  @override
  State<ProfessionCardItem> createState() => _ProfessionCardItemState();
}

class _ProfessionCardItemState extends State<ProfessionCardItem> {
  double _elevation = 0;

  // Your color constants
  static const primaryColor = Color(0xffFB9E11);
  static const darkBackgroundColor = Color(0xff110D12);
  static const lightBackgroundColor = Color(0xFFFFFFFF);

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final surfaceColor =
        isDarkMode ? darkBackgroundColor : lightBackgroundColor;

    return InkWell(
      onTap: () => setState(() => _elevation = 50),
      onTapCancel: () => setState(() => _elevation = 0),
      onHover: (event) => setState(() => _elevation = 50),
      borderRadius: BorderRadius.circular(12),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [surfaceColor, primaryColor.withOpacity(.2)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          border: Border.all(color: primaryColor, width: 1),
          borderRadius: BorderRadius.circular(12),
          boxShadow:
              _elevation > 0
                  ? [
                    BoxShadow(
                      color: primaryColor.withOpacity(.4),
                      blurRadius: 40,
                      offset: const Offset(0, 8),
                    ),
                  ]
                  : [],
        ),
        child: Card(
          color: Colors.transparent,
          elevation: 0,
          shadowColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: AspectRatio(
            aspectRatio: .8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AspectRatio(
                  aspectRatio: 1.6,
                  child: ClipRRect(
                    child: Image.asset(widget.imagePath, fit: BoxFit.contain),
                  ),
                ),
                20.toHeight,
                Expanded(
                  child: Text(
                    widget.title,
                    textAlign: TextAlign.center,
                    style: context.textStyle.titleMdBold.copyWith(
                      color: context.colorScheme.onSurface,
                      fontSize: 16,
                    ),
                    maxLines: 4,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
