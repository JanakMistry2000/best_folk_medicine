import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

import 'apis/api_services.dart';
import 'flavor_config.dart';
import 'routes.dart';
import 'strings.dart';
import "utils.dart";
import 'views/article_detail.dart';
import 'views/articles_detail_live.dart';
import 'views/homepage.dart';
import 'views/set_theme.dart';
import 'views/show_all_article.dart';
import 'views/splash_screen.dart';

final RouteObserver<ModalRoute<void>> routeObserver =
    RouteObserver<ModalRoute<void>>();

void main() {
  FlavorConfig(
      flavor: Flavor.LIVE,
      flavorColor: FlavorColor(),
      globalKey: MyAppState.gkey,
      baseUrl: AppString.baseUrl);
  _setupLogging();
  runApp(const MyApp());
}

void _setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
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
    return Provider(
      create: (_) => ArticleApiService.create(),
      dispose: (_, ArticleApiService services) => services.client.dispose(),
      child: MaterialApp(
        title: AppString.appname,
        theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Playfair'),
        navigatorKey: Utils.mainappnavi,
        routes: {
          AppRoutes.articledetail: (context) => const ArticleDetail(),
          AppRoutes.articledetaillive: (context) => const ArticleDetailLive(),
          AppRoutes.homepage: (context) => const HomePage(),
          AppRoutes.setheme: (context) => const SetTheme(),
          AppRoutes.showall: (context) => const ShowAllArticles()
        },
        home: const SplashScreen(),
      ),
    );
  }
}
