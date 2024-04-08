import "package:alin_ai/font_control/fontslider_provider.dart";
import "package:alin_ai/language/app_language.dart";
import "package:alin_ai/language/lang_localization.dart";
import "package:alin_ai/pages/change_app_language.dart";
import "package:alin_ai/pages/settings_page.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppLanguage>(
      builder: (context, appLanguage, child) {
        return Drawer(
          backgroundColor: Theme.of(context).colorScheme.background,
          child: Column(
            children: [
              // ALIN logo
              DrawerHeader(
                  child: Center(
                child: Image.asset(
                  'lib/images/ALIN_logo.png',
                  width: 200,
                  height: 200,
                ),
              )),

              Padding(
                padding: const EdgeInsets.only(left: 25.0, top: 25),
                child: ListTile(
                  title: Text(
                    AppLocalizations.of(context)?.translate('H O M E') ??
                        'H O M E',
                    style: TextStyle(
                        fontSize:
                            Provider.of<FontSliderProvider>(context).value,
                        fontWeight: FontWeight.bold),
                  ),
                  leading: const Icon(Icons.home),
                  onTap: () => Navigator.pop(context),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 25.0, top: 0),
                child: ListTile(
                  title: Text(
                    AppLocalizations.of(context)
                            ?.translate('S E T T I N G S') ??
                        'S E T T I N G S',
                    style: TextStyle(
                        fontSize:
                            Provider.of<FontSliderProvider>(context).value,
                        fontWeight: FontWeight.bold),
                  ),
                  leading: const Icon(Icons.settings),
                  onTap: () {
                    Navigator.pop(context);

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SettingsPage(),
                        ));
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0, top: 0),
                child: ListTile(
                  title: Text(
                    AppLocalizations.of(context)
                            ?.translate('C H A T L O G S') ??
                        'C H A T L O G S',
                    style: TextStyle(
                        fontSize:
                            Provider.of<FontSliderProvider>(context).value,
                        fontWeight: FontWeight.bold),
                  ),
                  leading: const Icon(Icons.history),
                  onTap: () => Navigator.pop(context),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0, top: 0),
                child: ListTile(
                  title: Text(
                    AppLocalizations.of(context)!
                            .translate('L A N G U A G E') ??
                        'L A N G U A G E',
                    style: TextStyle(
                        fontSize:
                            Provider.of<FontSliderProvider>(context).value,
                        fontWeight: FontWeight.bold),
                  ),
                  leading: const Icon(Icons.language),
                  onTap: () {
                    Navigator.pop(context);

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AppLang(),
                        ));
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
