import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

import 'flavor_config.dart';
import 'main.dart';

void main() {
  FlavorConfig(
      flavor: Flavor.DEV,
      flavorColor: FlavorColor(),
      globalKey: MyAppState.gkey,
      baseUrl: "");
  _setupLogging();
  runApp(const MyApp());
}

void _setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
}
