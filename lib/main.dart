import 'package:best_folk_medicine/views/login.dart';
import 'package:best_folk_medicine/views/sign_up.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

import 'apis/api_services.dart';
import 'database/database_moor.dart';
import 'database/database_shared_preferences.dart';
import 'flavor_config.dart';
import 'mobx/mobx_store.dart';
import 'models/article_hive.dart';
import 'routes.dart';
import 'strings.dart';
import "utils.dart";
import 'views/articles_detail_live.dart';
import 'views/homepage.dart';
import 'views/set_theme.dart';
import 'views/show_all_article.dart';
import 'views/splash_screen.dart';

final RouteObserver<ModalRoute<void>> routeObserver =
    RouteObserver<ModalRoute<void>>();

void main() async {
  FlavorConfig(
      flavor: Flavor.LIVE,
      flavorColor: FlavorColor(),
      globalKey: MyAppState.gkey,
      baseUrl: AppString.baseUrl);
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

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  static GlobalKey<MyAppState> gkey = GlobalKey<MyAppState>();

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print(FlavorConfig.instance.flavor.toString() +
          FlavorConfig.isQA().toString());
    }
    return MultiProvider(
      providers: [
        Provider(
            create: (_) => ArticleApiService.create(),
            dispose: (_, ArticleApiService services) =>
                services.client.dispose()),
        Provider(
          create: (_) => MobxStore(ArticleApiService.create()),
          dispose: (context, MobxStore store) {
            store.dispose;
          },
        ),
        Provider(create: (_) => DatabaseMoor()),
        Provider(create: (_) => DatabaseSharedPreferences())
      ],
      child: MaterialApp(
        title: AppString.appname,
        theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Playfair'),
        navigatorKey: Utils.mainappnavi,
        routes: {
          AppRoutes.articledetaillive: (context) => const ArticleDetailLive(),
          AppRoutes.homepage: (context) => const HomePage(),
          AppRoutes.setheme: (context) => const SetTheme(),
          AppRoutes.showall: (context) => const ShowAllArticles(),
          AppRoutes.login: (context) => const Login(),
          AppRoutes.signup: (context) => const SignUp()
        },
        home: const SplashScreen(),
      ),
    );
  }
}
