import "package:alin_ai/font_control/fontslider_provider.dart";
import "package:alin_ai/pages/dark_mode_toggle.dart";
import "package:alin_ai/pages/font_slider_toggle.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final fontSizeProvider = Provider.of<FontSliderProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("S E T T I N G S"),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: <Widget>[
          const DarkModeContainer(),
          FontSliderContainer(fontSizeProvider: fontSizeProvider),
        ],
      ),
    );
  }
}
