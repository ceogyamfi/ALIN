import "package:alin_ai/components/drawer.dart";
import "package:alin_ai/font_control/fontslider_provider.dart";
import "package:alin_ai/language/lang_localization.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Center(
          child: Image.asset(
            'lib/images/ALIN_logo.png',
            width: 80, 
            height: 80, 
          ),
          // child: Text(
          //   AppLocalizations.of(context)?.translate('ALIN') ?? 'ALIN',
          //   style: TextStyle(
          //       fontSize: Provider.of<FontSliderProvider>(context).value,
          //       fontWeight: FontWeight.bold),
          // ),
          // child: Text("ALIN"),
        ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
