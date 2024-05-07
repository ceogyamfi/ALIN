import "package:alin_ai/components/drawer_list_tile.dart";
import "package:alin_ai/language/app_language.dart";
import "package:alin_ai/language/lang_localization.dart";
import "package:alin_ai/pages/change_app_language.dart";
import "package:alin_ai/pages/settings_page.dart";
import "package:alin_ai/pages/starter_home_page.dart";
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
              DrawerHeader(
                  child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: Image.asset(
                      'lib/images/ALIN_Logo_second.png',
                      width: 100,
                      height: 100,
                    ),
                  ),
                  const Expanded(
                    child: Text(
                      'ALIN',
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              )),
              buildListTile(
                context,
                AppLocalizations.of(context)?.translate('H O M E') ?? 'H O M E',
                Icons.home,
                const StarterHomeUI(),
              ),
              buildListTile(
                context,
                AppLocalizations.of(context)?.translate('S E T T I N G S') ??
                    'S E T T I N G S',
                Icons.settings,
                const SettingsPage(),
              ),
              // buildListTile(
              //   context,
              //   AppLocalizations.of(context)?.translate('C H A T L O G S') ??
              //       'C H A T L O G S',
              //   Icons.history,
              //   const StarterHomeUI(),
              // ),
              buildListTile(
                context,
                AppLocalizations.of(context)?.translate('L A N G U A G E') ??
                    'L A N G U A G E',
                Icons.language,
                const AppLang(),
              ),
            ],
          ),
        );
      },
    );
  }
}
