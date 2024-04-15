import 'package:alin_ai/font_control/fontslider_provider.dart';
import 'package:alin_ai/language/app_language.dart';
import 'package:alin_ai/language/lang_localization.dart';
import 'package:alin_ai/pages/home_page.dart';
import 'package:alin_ai/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppLanguage appLanguage = AppLanguage();
  await appLanguage.fetchLocale();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
      ),
      ChangeNotifierProvider(create: (context) => FontSliderProvider()),
      ChangeNotifierProvider.value(value: appLanguage),
    ],
    child: MainApp(
      appLanguage: appLanguage,
    ),
  ));
}

class MainApp extends StatelessWidget {
  final AppLanguage appLanguage;

  const MainApp({super.key, required this.appLanguage});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppLanguage>(
      create: (_) => appLanguage,
      child: Consumer<AppLanguage>(builder: (context, model, child) {
        return MaterialApp(
          locale: model.appLocal,
          supportedLocales: const [
            Locale('en', 'US'),
            Locale('ar', ''),
            Locale('es', ''),
            Locale('zh', ''),
          ],
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          home: const HomePage(),
          theme: Provider.of<ThemeProvider>(context).themeData,
        );
      }),
    );
  }
}
