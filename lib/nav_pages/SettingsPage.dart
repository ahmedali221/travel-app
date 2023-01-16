import 'package:flutter/material.dart';

import 'package:settings_ui/settings_ui.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool initVal = false;
  bool second = false;
  bool third = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 15),
        child: SettingsList(
          applicationType: ApplicationType.cupertino,
          sections: [
            SettingsSection(
              title: const Text(
                'Common',
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              tiles: <SettingsTile>[
                SettingsTile.navigation(
                  leading: const Icon(Icons.language),
                  title: const Text('Language'),
                  trailing: const Text('English'),
                  onPressed: (context) {
                    print('object');
                  },
                ),
                SettingsTile.switchTile(
                  onToggle: (value) {
                    setState(() {
                      initVal = !initVal;
                    });
                  },
                  initialValue: initVal,
                  leading: const Icon(Icons.format_paint),
                  title: const Text('Enable custom theme'),
                ),
                SettingsTile.navigation(
                  leading: const Icon(Icons.cloud),
                  title: const Text('Environment'),
                  value: const Text('Production'),
                ),
              ],
            ),
            SettingsSection(
              title: const Text(
                'Accounts',
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              tiles: <SettingsTile>[
                SettingsTile.navigation(
                  leading: const Icon(Icons.phone),
                  title: const Text('Phone Number'),
                ),
                SettingsTile.navigation(
                  leading: const Icon(Icons.email),
                  title: const Text('Email'),
                ),
                SettingsTile.navigation(
                  leading: const Icon(Icons.exit_to_app),
                  title: const Text('Sign Out'),
                ),
              ],
            ),
            SettingsSection(
              title: const Text(
                'Security',
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              tiles: <SettingsTile>[
                SettingsTile.switchTile(
                  onToggle: (value) {
                    setState(() {
                      second = value;
                    });
                  },
                  initialValue: second,
                  leading: const Icon(Icons.lock),
                  title: const Text('Lock app in the background'),
                ),
                SettingsTile.switchTile(
                  onToggle: (value) {
                    setState(() {
                      third = value;
                    });
                  },
                  initialValue: third,
                  leading: const Icon(Icons.fingerprint),
                  title: const Text('Use fingerprint'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
