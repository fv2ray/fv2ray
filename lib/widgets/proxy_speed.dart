import 'package:flutter/material.dart';
import 'package:fv2ray/utils/data_watcher.dart';

import '../utils/format_byte.dart';

class ProxySpeeds extends StatefulWidget {
  const ProxySpeeds({super.key});

  @override
  State<ProxySpeeds> createState() => _ProxySpeedsState();
}

class _ProxySpeedsState extends State<ProxySpeeds> {
  final limitCount = 60;

  @override
  void initState() {
    super.initState();
  }

  Widget keyValueRow(String key, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          key,
        ),
        Text(
          value,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: dataWatcher,
      builder: (BuildContext context, Widget? child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            keyValueRow(
              "↑",
              "${formatBytes(dataWatcher.trafficStatCur[TrafficStatType.proxyUp]!)}ps",
            ),
            keyValueRow(
              "↓",
              "${formatBytes(dataWatcher.trafficStatCur[TrafficStatType.proxyDn]!)}ps",
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    // timer.cancel();
    super.dispose();
  }
}
