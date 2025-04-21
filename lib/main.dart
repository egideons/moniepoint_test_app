import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/core/theme/app_theme.dart';
import 'package:test_app/core/utils/extensions.dart';
import 'package:test_app/core/utils/theme_service.dart';
import 'package:test_app/views/custom_navigation_screen.dart';

late SharedPreferences prefs;
void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();

  final themeService = ThemeService();
  final savedThemeMode = await themeService.loadThemeMode();
  runApp(MyApp(savedThemeMode));
}

class MyApp extends StatelessWidget {
  final ThemeMode themeMode;
  const MyApp(this.themeMode, {super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gideon | Dart',
      debugShowCheckedModeBanner: false,
      onGenerateTitle: (context) => context.texts.appTitle,
      theme: AppTheme().light,
      darkTheme: AppTheme().dark,
      themeMode: themeMode,
      scrollBehavior: ScrollConfiguration.of(
        context,
      ).copyWith(multitouchDragStrategy: MultitouchDragStrategy.sumAllPointers),

      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'), // English
      ],
      locale: Locale("en"),
      home: CustomNavigationScreen(),
    );
  }
}
