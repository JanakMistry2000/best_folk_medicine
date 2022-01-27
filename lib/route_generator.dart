import 'routes.dart';
import 'strings.dart';
import 'views/decrement.dart';
import 'views/errorpage.dart';
import 'views/increment_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    Widget page;
    final args = settings.arguments;
    switch (settings.name) {
      case AppRoutes.incrementpage:
        page = IncrementPage(
          chg_title: args as Function,
        );
        break;
      case AppRoutes.decrementpage:
        if (args is Map) {
          page = DecrementPage(
            counter: args['counter'],
            chg_title: args['function'],
          );
        } else {
          page = const ErrorPage(errormeg: AppString.invalidarguments);
        }
        break;
      default:
        page = const ErrorPage(errormeg: AppString.error404);
    }
    return PageRouteBuilder(
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(-1, 0),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      ),
      pageBuilder: (context, animation, secondaryAnimation) {
        return page;
      },
    );
  }
}
