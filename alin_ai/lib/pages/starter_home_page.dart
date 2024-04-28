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
        padding: const EdgeInsets.only(bottom: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 5),
            _buildWelcomeText(),
            _buildAlinText(),
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Image.asset(
                  'lib/images/ALIN_Logo_second.png',
                  width: 300,
                  height: 300,
                ),
              ),
            ),
            const SizedBox(height: 10),
            _buildIconButton(
              icon: Icons.settings,
              label: 'Settings',
              onPressed: () {
                _navigateToPage(context, const SettingsPage());
              },
            ),
            const SizedBox(height: 10),
            _buildIconButton(
              icon: Icons.settings_backup_restore_sharp,
              label: 'View Previous chats',
              onPressed: () {
                _navigateToPage(context, const HomePage());
              },
            ),
            const SizedBox(height: 10),
            _buildIconButton(
              icon: Icons.add,
              label: 'Create new chat',
              onPressed: () {
                _navigateToPage(context, const HomePage());
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWelcomeText() {
    return Container(
      padding: const EdgeInsets.all(50.0),
      alignment: Alignment.center,
      child: const Text(
        'Welcome',
        style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildAlinText() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 1.0),
      alignment: Alignment.center,
      child: const Text(
        'I am ALIN',
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
      ),
    );
  }

  Widget _buildIconButton({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return Container(
      width: 370,
      decoration: BoxDecoration(
        color: const Color(0xFF1C487B),
        borderRadius: BorderRadius.circular(5),
      ),
      child: IconButton(
        hoverColor: Colors.transparent,
        onPressed: onPressed,
        icon: Row(
          children: [
            Icon(icon),
            Expanded(
              child: Text(
                label,
                textAlign: TextAlign.center,
              ),
            ),
            const Icon(Icons.navigate_next),
          ],
        ),
      ),
    );
  }

  void _navigateToPage(BuildContext context, Widget page) {
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }
}
