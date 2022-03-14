import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

import 'flavor_config.dart';
import 'main.dart';
import 'strings.dart';

//final RouteObserver<ModalRoute<void>> routeObserver =
//    RouteObserver<ModalRoute<void>>();

void main() async {
  FlavorConfig(
      flavor: Flavor.QA,
      flavorColor: FlavorColor(),
      globalKey: MyAppState.gkey,
      baseUrl: AppString.baseUrl);
  _setupLogging();
  runApp(const MyApp());
}

void _setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    if (kDebugMode) {
      print('${rec.level.name}: ${rec.time}: ${rec.message}');
    }
  });
}
