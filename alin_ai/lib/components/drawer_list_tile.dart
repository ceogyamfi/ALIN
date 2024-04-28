import 'package:alin_ai/font_control/fontslider_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

ListTile buildListTile(
    BuildContext context, String title, IconData icon, Widget destination) {
  return ListTile(
    title: Text(
      title,
      style: TextStyle(
        fontSize: Provider.of<FontSliderProvider>(context).value,
        fontWeight: FontWeight.bold,
      ),
    ),
    leading: Icon(
      icon,
    ),
    onTap: () {
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => destination,
        ),
      );
    },
  );
}
