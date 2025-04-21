// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:test_app/core/theme/app_colors.dart';
import 'package:test_app/core/utils/app_icons.dart';
import 'package:test_app/core/utils/app_sizing.dart';
import 'package:test_app/widgets/custom_bottom_nav_icon.dart';

class CustomBottomNavigation extends StatelessWidget {
  final int currentIndex;
  final Function(int) onIndexChanged;
  const CustomBottomNavigation({
    super.key,
    required this.currentIndex,
    required this.onIndexChanged,
  });

  @override
  Widget build(BuildContext context) {
    final listOfBottomNavIcons = [
      {"icon": AppIcons.searchNormal, "index": 0},
      {"icon": AppIcons.message, "index": 1},
      {"icon": AppIcons.home, "index": 2},
      {"icon": AppIcons.heart, "index": 3},
      {"icon": AppIcons.frame, "index": 4},
    ];

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: EdgeInsets.symmetric(horizontal: Insets.xs, vertical: Insets.sm),
      decoration: ShapeDecoration(
        color: AppColors.gray[900],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        shadows: [
          BoxShadow(
            color: AppColors.gray[800]!.withOpacity(.8),
            blurRadius: 5,
            offset: Offset(2, 2),
            spreadRadius: .5,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:
            listOfBottomNavIcons.map<Widget>((item) {
              final int index = item["index"] as int;
              return customBottomNavIcon(
                context,
                onTap: () => onIndexChanged(index),
                isSelected: index == currentIndex,
                iconPath: item["icon"] as String,
              );
            }).toList(),
      ),
    );
  }
}
