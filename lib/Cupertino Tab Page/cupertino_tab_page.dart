import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoTabPage extends StatelessWidget {
  const CupertinoTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Home',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(CupertinoIcons.person_2),
          //   label: 'Settings',
          // ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings),
            label: 'Settings',
          ),
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return CupertinoTabView(builder: (context) => const HomePage());
          case 1:
            return CupertinoTabView(builder: (context) => const SettingsPage());
          default:
            return CupertinoTabView(builder: (context) => const HomePage());
        }
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(middle: Text('Home')),
      child: Center(
        child: CupertinoButton(
          child: const Text('Go to Details'),
          onPressed: () {
            // كل تبويب عنده navigation مستقل
            Navigator.of(context).push(
              CupertinoPageRoute(builder: (context) => const DetailsPage()),
            );
          },
        ),
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('Settings Content')));
  }
}

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text('Details')),
      child: Center(child: Text('Details Page')),
    );
  }
}
