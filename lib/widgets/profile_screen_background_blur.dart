// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:test_app/core/utils/app_sizing.dart';
import 'package:test_app/core/utils/extensions.dart';

class ProfileScreenBackgroundBlur extends StatelessWidget {
  const ProfileScreenBackgroundBlur({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: -(context.width / 2 / 2),
      top: (-(context.width / 2 / 2)) + Insets.xxxl,
      child: Container(
        width: context.width / 2,
        height: context.height / 2,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              blurRadius: 200,
              spreadRadius: 100,
              color: context.colorScheme.primary.withOpacity(.4),
            ),
          ],
        ),
      ),
    );
  }
}
