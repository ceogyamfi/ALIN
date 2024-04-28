import 'package:alin_ai/pages/home_page.dart';
import 'package:flutter/material.dart';

class CustomBottom extends StatelessWidget {
  const CustomBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 25.0, top: 0),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.settings),
              iconSize: 30,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 0),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
              },
              icon: Icon(
                Icons.add_box,
                color: Colors.indigo[900],
              ),
              iconSize: 50,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 25.0, top: 0),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.history),
              iconSize: 30,
            ),
          ),
        ],
      ),
    );
  }
}
