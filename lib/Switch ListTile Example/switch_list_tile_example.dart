import 'package:flutter/material.dart';

class SwitchListTileExample extends StatefulWidget {
  const SwitchListTileExample({super.key});

  @override
  State<SwitchListTileExample> createState() => _SwitchListTileExampleState();
}

class _SwitchListTileExampleState extends State<SwitchListTileExample> {
  bool isSwitched1 = false;
  bool isSwitched2 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SwitchListTile Example')),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text('Enable Notifications'),
            subtitle: const Text('Receive notifications from the app'),
            value: isSwitched1,
            onChanged: (bool value) {
              setState(() {
                isSwitched1 = value;
              });
            },
            secondary: const Icon(Icons.notifications),
          ),
          const Divider(),
          SwitchListTile(
            title: const Text('Dark Mode'),
            subtitle: const Text('Use dark theme in the app'),
            value: isSwitched2,
            onChanged: (bool value) {
              setState(() {
                isSwitched2 = value;
              });
            },
            secondary: const Icon(Icons.dark_mode),
          ),
        ],
      ),
    );
  }
}
