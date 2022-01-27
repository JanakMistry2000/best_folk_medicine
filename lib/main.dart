import 'routes.dart';
import "utils.dart";
import 'views/article_detail.dart';
import 'strings.dart';
import 'views/homepage.dart';
import 'package:flutter/material.dart';

final RouteObserver<ModalRoute<void>> routeObserver =
    RouteObserver<ModalRoute<void>>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppString.appname,
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Playfair'),
      navigatorKey: Utils.mainappnavi,
      routes: {
        AppRoutes.articledetail: (context) => const ArticleDetail(),
      },
      home: const HomePage(),
    );
  }
}
