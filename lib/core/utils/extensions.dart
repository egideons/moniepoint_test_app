import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:test_app/core/utils/app_sizing.dart';
import 'package:test_app/core/utils/app_text_style.dart';

enum FormFactorType { mobile, tablet, desktop }

extension StyledContext on BuildContext {
  Size get screenSize => MediaQuery.sizeOf(this);

  double get width => screenSize.width;
  double get height => screenSize.height;

  ThemeData get theme => Theme.of(this);

  FormFactorType get formFactor {
    if (width < 600) {
      return FormFactorType.mobile;
    } else if (width < 900) {
      return FormFactorType.tablet;
    } else {
      return FormFactorType.desktop;
    }
  }

  bool get isMobile => formFactor == FormFactorType.mobile;
  bool get isTablet => formFactor == FormFactorType.tablet;
  bool get isDesktop => formFactor == FormFactorType.desktop;
  bool get isDesktopOrTablet => isTablet || isDesktop;

  AppTextStyle get textStyle {
    switch (formFactor) {
      case FormFactorType.mobile:
      case FormFactorType.tablet:
        return SmallTextStyles();

      default:
        FormFactorType.desktop;
        return LargeTextStyles();
    }
  }

  AppInsets get insets {
    switch (formFactor) {
      case FormFactorType.mobile:
        return SmallInsets();
      case FormFactorType.tablet:
      case FormFactorType.desktop:
        return LargeInsets();
    }
  }

  AppLocalizations get texts =>
      AppLocalizations.of(this) ?? lookupAppLocalizations(const Locale("en"));

  ColorScheme get colorScheme => theme.colorScheme;
}

extension SizedBoxExtension on int {
  Widget get toHeight {
    return SizedBox(height: toDouble());
  }

  Widget get toWidth {
    return SizedBox(width: toDouble());
  }
}
