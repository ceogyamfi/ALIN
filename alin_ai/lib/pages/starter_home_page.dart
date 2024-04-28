import 'package:alin_ai/pages/home_page.dart';
import 'package:alin_ai/pages/settings_page.dart';
import 'package:flutter/material.dart';

class StarterHomeUI extends StatelessWidget {
  const StarterHomeUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.all(5.0),
              alignment: Alignment.center,
              child: const Text(
                'Welcome',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(5.0),
              alignment: Alignment.center,
              child: const Text(
                'I am ALIN',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Image.asset(
                  'lib/images/ALIN_Logo_second.png',
                  width: 200,
                  height: 200,
                ),
              ),
            ),
            const SizedBox(height: 10),
            //Settings Page Icon Button
            Container(
              width: 450,
              decoration: BoxDecoration(
                color: const Color(0xFF1C487B),
                borderRadius: BorderRadius.circular(5),
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SettingsPage(),
                    ),
                  );
                },
                icon: const Row(
                  children: [
                    Icon(Icons.settings),
                    Expanded(
                      child: Text(
                        'Settings',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Icon(Icons.navigate_next),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),

            //Previous Chat Icon Button
            Container(
              width: 450,
              decoration: BoxDecoration(
                color: const Color(0xFF1C487B),
                borderRadius: BorderRadius.circular(5),
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  );
                },
                icon: const Row(
                  children: [
                    Icon(Icons.settings_backup_restore_sharp),
                    Expanded(
                      child: Text(
                        'View Previous chats',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Icon(Icons.navigate_next),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),

            //Home Page Icon
            Container(
              width: 450,
              decoration: BoxDecoration(
                color: const Color(0xFF1C487B),
                borderRadius: BorderRadius.circular(5),
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  );
                },
                icon: const Row(
                  children: [
                    Icon(Icons.add),
                    Expanded(
                      child: Text(
                        'Create new chat',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Icon(Icons.navigate_next),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
