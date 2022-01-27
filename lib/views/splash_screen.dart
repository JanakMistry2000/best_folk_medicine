import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

import '../database/database_shared_preferences.dart';
import '../flavor_config.dart';
import '../mobx/mobx_store.dart';
import '../routes.dart';
import '../strings.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late MobxStore store;
  late DatabaseSharedPreferences pref;
  bool allPermissionCheck = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    store = Provider.of<MobxStore>(context);
    pref = Provider.of<DatabaseSharedPreferences>(context);
  }

  Future getPermission() async {
    if (!pref.sharedPreferences.containsKey('initialPermission')) {
      pref.sharedPreferences.setBool("initialPermission", true);
    }
    if (Platform.isIOS) {
      if (pref.sharedPreferences.getBool("initialPermission")!) {
        await store.notification.request().then((value) {
          if (value.isGranted || value.isLimited) {
            store.notificationStatus = Observable(true);
          }
          allPermissionCheck = true;
        });
      }

      if (store.storageStatus.value &&
          pref.sharedPreferences.getBool("initialPermission")!) {
        await store.storage.request().then((value) {
          if (value.isGranted || value.isLimited) {
            store.storageStatus = Observable(true);
          }
        });
      }
    } else if (Platform.isAndroid) {
      if (!store.notificationStatus.value &&
          pref.sharedPreferences.getBool("initialPermission")!) {
        await store.notification.request().then((value) {
          if (value.isGranted || value.isLimited) {
            store.notificationStatus = Observable(true);
          }
          allPermissionCheck = true;
        });
      }
    }
    if (pref.sharedPreferences.getBool("initialPermission")! &&
        allPermissionCheck) {
      pref.sharedPreferences.setBool("initialPermission", false);
    }
  }

  void splash() {
    Future.delayed(const Duration(milliseconds: 2000), () async {
      await getPermission();
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
