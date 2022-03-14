import 'package:flutter/material.dart';

import '../flavor_config.dart';
import '../routes.dart';
import '../strings.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void splash() {
    Future.delayed(const Duration(milliseconds: 2000), () {
      if (FlavorConfig.isLive()) {
        Navigator.pushReplacementNamed(context, AppRoutes.homepage);
      } else if (FlavorConfig.isQA()) {
        Navigator.pushReplacementNamed(context, AppRoutes.homepage);
      } else {
        Navigator.pushReplacementNamed(context, AppRoutes.setheme);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    splash();
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Text(
            AppString.appname,
            style: TextStyle(
                fontSize: 25,
                color: FlavorConfig.instance.flavorColor.primarycolor),
          ),
        ),
      ),
    );
  }
}
