import 'flavor_config.dart';
import 'main.dart';
import 'package:flutter/material.dart';

void main() {
  FlavorConfig(
      flavor: Flavor.DEV,
      flavorColor: FlavorColor(),
      globalKey: MyAppState.gkey,
      baseUrl: "");
  runApp(const MyApp());
}
