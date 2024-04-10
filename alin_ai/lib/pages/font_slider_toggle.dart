import 'package:flutter/material.dart';
import 'package:alin_ai/font_control/fontslider_provider.dart';

class FontSliderContainer extends StatelessWidget {
  final FontSliderProvider fontSizeProvider;

  const FontSliderContainer({required this.fontSizeProvider, super.key});

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
          Expanded(
            child: Text(
              "Font Slider",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: fontSizeProvider.value,
              ),
            ),
          ),
          Slider(
            value: fontSizeProvider.value,
            activeColor: Colors.white,
            inactiveColor: Colors.white,
            onChanged: (value) {
              fontSizeProvider.increment(value);
            },
            divisions: 5,
            min: 15,
            max: 25,
          ),
        ],
      ),
    );
  }
}
