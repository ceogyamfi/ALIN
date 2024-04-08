import 'package:alin_ai/language/app_language.dart';
import 'package:alin_ai/language/lang_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppLang extends StatelessWidget {
  const AppLang({super.key});

  @override
  Widget build(BuildContext context) {
    var appLanguage = Provider.of<AppLanguage>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)?.translate('title') ?? ''),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              AppLocalizations.of(context)?.translate('Message') ?? '',
              style: const TextStyle(fontSize: 32),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    appLanguage.changeLanguage(const Locale("en"));
                  },
                  child: const Text('English'),
                ),
                ElevatedButton(
                  onPressed: () {
                    appLanguage.changeLanguage(const Locale("ar"));
                  },
                  child: const Text('العربي'),
                ),
                ElevatedButton(
                  onPressed: () {
                    appLanguage.changeLanguage(const Locale("es"));
                  },
                  child: const Text('Español'),
                ),
                ElevatedButton(
                  onPressed: () {
                    appLanguage.changeLanguage(const Locale("zh"));
                  },
                  child: const Text('中文'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
