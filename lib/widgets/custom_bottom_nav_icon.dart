// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_app/core/theme/app_colors.dart';
import 'package:test_app/core/utils/app_sizing.dart';
import 'package:test_app/core/utils/extensions.dart';

customBottomNavIcon(
  BuildContext context, {
  required void Function()? onTap,
  required bool isSelected,
  required String iconPath,
}) {
  return InkWell(
    onTap: onTap ?? () {},
    enableFeedback: true,
    hoverColor:
        isSelected
            ? context.colorScheme.primary.withOpacity(.4)
            : AppColors.gray[900]!.withOpacity(.4),
    focusColor:
        isSelected
            ? context.colorScheme.primary.withOpacity(.4)
            : AppColors.gray[900]!.withOpacity(.4),
    overlayColor: WidgetStatePropertyAll(
      context.colorScheme.primary.withOpacity(.4),
    ),
    borderRadius: BorderRadius.circular(100),
    child: AnimatedContainer(
      duration: Duration(milliseconds: 300),
      padding:
          isSelected
              ? EdgeInsets.symmetric(
                horizontal: Insets.med,
                vertical: Insets.med,
              )
              : EdgeInsets.symmetric(
                horizontal: Insets.sm,
                vertical: Insets.sm,
              ),
      decoration: ShapeDecoration(
        color: isSelected ? context.colorScheme.primary : AppColors.gray[850],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      ),
      child: Center(
        child: SvgPicture.asset(
          iconPath,
          color: AppColors.lightBackgroundColor,
        ),
      ),
    ),
  );
}
