import 'package:best_folk_medicine/views/set_theme.dart';
import 'package:best_folk_medicine/views/splash_screen.dart';

import 'flavor_config.dart';
import 'routes.dart';
import "utils.dart";
import 'views/article_detail.dart';
import 'strings.dart';
import 'views/homepage.dart';
import 'package:flutter/material.dart';

final RouteObserver<ModalRoute<void>> routeObserver =
    RouteObserver<ModalRoute<void>>();

void main() {
  FlavorConfig(
      flavor: Flavor.LIVE,
      flavorColor: FlavorColor(),
      globalKey: MyAppState.gkey);
  runApp(const MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  static GlobalKey<MyAppState> gkey = GlobalKey<MyAppState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppString.appname,
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Playfair'),
      navigatorKey: Utils.mainappnavi,
      routes: {
        AppRoutes.articledetail: (context) => const ArticleDetail(),
        AppRoutes.homepage: (context) => const HomePage(),
        AppRoutes.setheme : (context) => const SetTheme()
      },
      home: const SplashScreen(),
    );
  }
}
