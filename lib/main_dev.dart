import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:logging/logging.dart';

import 'flavor_config.dart';
import 'main.dart';
import 'models/article_hive.dart';

void main() async {
  FlavorConfig(
      flavor: Flavor.DEV,
      flavorColor: FlavorColor(),
      globalKey: MyAppState.gkey,
      baseUrl: "");
  _setupLogging();
  await Hive.initFlutter();
  Hive.registerAdapter(ArticleHiveAdapter());
  await Hive.openBox('articles');
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
