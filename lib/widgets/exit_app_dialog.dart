import 'package:flutter/material.dart';
import 'package:test_app/core/utils/app_sizing.dart';
import 'package:test_app/core/utils/extensions.dart';

class ExitAppDialog extends StatelessWidget {
  const ExitAppDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      backgroundColor: context.colorScheme.surface,
      insetAnimationCurve: Curves.easeInOut,
      insetAnimationDuration: const Duration(milliseconds: 300),
      shadowColor: context.colorScheme.outlineVariant,
      surfaceTintColor: context.colorScheme.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      titlePadding: EdgeInsets.only(
        top: Insets.lg,
        left: Insets.lg,
        right: Insets.lg,
      ),
      contentPadding: EdgeInsets.only(
        top: Insets.lg,
        left: Insets.lg,
        right: Insets.lg,
      ),
      actionsPadding: EdgeInsets.symmetric(
        horizontal: Insets.lg,
        vertical: Insets.lg,
      ),
      title: Text(
        context.texts.exitApp,
        style: context.textStyle.titleLgBold.copyWith(
          color: context.colorScheme.primary,
        ),
      ),

      content: Text(context.texts.exitAppConfirmation),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text(
            context.texts.no,
            style: context.textStyle.bodyLgBold.copyWith(
              color: context.colorScheme.primary,
            ),
          ),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: Text(
            context.texts.yes,
            style: context.textStyle.bodyLgMedium.copyWith(
              color: context.colorScheme.onSurface,
            ),
          ),
        ),
      ],
    );
  }
}
