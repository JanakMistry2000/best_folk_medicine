import '../main.dart';
import '../utils.dart';
import '../route_generator.dart';
import '../routes.dart';
import 'package:flutter/material.dart';

import '../strings.dart';

class Favourite extends StatefulWidget {
  const Favourite({Key? key}) : super(key: key);

  @override
  _FavouriteState createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  String title = AppString.increment;

  void changeTitle(String value) {
    setState(() {
      title = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          const SizedBox(
            height: 35,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
          Expanded(
            child: SizedBox.expand(
                child: Navigator(
              key: Utils.incdecnavi,
              initialRoute: AppRoutes.incrementpage,
              observers: <RouteObserver<ModalRoute<void>>>[routeObserver],
              onGenerateInitialRoutes: (navigator, initialRoute) {
                return [
                  navigator.widget.onGenerateRoute!(RouteSettings(
                      name: AppRoutes.incrementpage, arguments: changeTitle))!,
                ];
              },
              onGenerateRoute: RouteGenerator.generateRoute,
            )),
          ),
        ],
      ),
    );
  }
}
