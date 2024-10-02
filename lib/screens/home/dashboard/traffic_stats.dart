import 'package:flutter/material.dart';
import 'package:fv2ray/utils/core_data_notifier.dart';

import '../../../utils/format_byte.dart';

class TrafficStats extends StatefulWidget {
  const TrafficStats({super.key});

  @override
  State<TrafficStats> createState() => _TrafficStatsState();
}

class _TrafficStatsState extends State<TrafficStats> {
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
      listenable: coreDataNotifier,
      builder: (BuildContext context, Widget? child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            keyValueRow(
              "direct ↑",
              formatBytes(
                  coreDataNotifier.trafficStatAgg[TrafficStatType.directUp]!),
            ),
            keyValueRow(
              "direct ↓",
              formatBytes(
                  coreDataNotifier.trafficStatAgg[TrafficStatType.directDn]!),
            ),
            keyValueRow(
              "proxy ↑",
              formatBytes(coreDataNotifier.trafficStatAgg[TrafficStatType.proxyUp]!),
            ),
            keyValueRow(
              "proxy ↓",
              formatBytes(coreDataNotifier.trafficStatAgg[TrafficStatType.proxyDn]!),
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
