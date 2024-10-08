import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fv2ray/screens/home/settings/tun.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'settings/about.dart';
import 'settings/assets.dart';
import 'settings/cores.dart';
import 'settings/general.dart';
import 'settings/profile_override.dart';

class SettingList extends StatefulWidget {
  const SettingList({
    super.key,
  });

  @override
  State<SettingList> createState() => _SettingListState();
}

class _SettingListState extends State<SettingList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.settings),
              ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Wrap(children: [
          ListTile(
            title: const Text("General"),
            subtitle: const Text("Auto startup, tray icon, etc."),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const GeneralScreen()),
              );
            },
          ),
          ListTile(
            title: const Text("Core"),
            subtitle: const Text("Path of core exectuable, assets, etc."),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CoresScreen()),
              );
            },
          ),
          ListTile(
            title: const Text("Profile override"),
            subtitle: const Text("Inject configuration into v2ray profile"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ProfileOverrideScreen()),
              );
            },
          ),
          ListTile(
            title: const Text("Asset"),
            subtitle: const Text("Assets remote auto update, etc."),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AssetsScreen()),
              );
            },
          ),
          if (Platform.isAndroid || Platform.isIOS)
            ListTile(
                title: const Text("Tun"),
                subtitle: const Text("Tun adaptor"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const TunScreen()),
                  );
                }),
          ListTile(
            title: const Text("About"),
            subtitle: const Text("fv2ray"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AboutScreen()),
              );
            },
          ),
        ]),
      ),
    );
  }
}
