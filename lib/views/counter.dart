import 'package:flutter/material.dart';

import '../main.dart';
import '../route_generator.dart';
import '../routes.dart';
import '../strings.dart';
import '../utils.dart';

class CounterView extends StatefulWidget {
  const CounterView({Key? key}) : super(key: key);

  @override
  _CounterViewState createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
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
              key: incdecnavi,
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

  @override
  void dispose() {
    super.dispose();
    Utils.dprint("favorite removed");
  }
}
