import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:alin_ai/font_control/fontslider_provider.dart';
import 'package:alin_ai/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class DarkModeContainer extends StatelessWidget {
  const DarkModeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Dark Mode",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: Provider.of<FontSliderProvider>(context).value,
            ),
          ),
          CupertinoSwitch(
            value:
                Provider.of<ThemeProvider>(context, listen: false).isDarkMode,
            onChanged: (value) =>
                Provider.of<ThemeProvider>(context, listen: false)
                    .toggleTheme(),
          ),
        ],
      ),
    );
  }
}
