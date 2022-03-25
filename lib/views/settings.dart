import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

import '../database/database_shared_preferences.dart';
import '../mobx/mobx_store.dart';
import '../routes.dart';
import '../strings.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool notifications = false;
  late DatabaseSharedPreferences dbPref;
  dynamic curUser;
  late MobxStore store;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    store = Provider.of<MobxStore>(context);
    dbPref = Provider.of<DatabaseSharedPreferences>(context);
    if (dbPref.isLogin) {
      curUser = jsonDecode(dbPref.sharedPreferences.getString("currentUser")!);
    }
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
              children: const [
                Text(
                  AppString.settings,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
          Container(
              child: dbPref.isLogin
                  ? Text(
                      "Welcome " + curUser['name'] + ",",
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  : null),
          Expanded(
              child: Column(
            children: [
              ListTile(
                title: const Text(AppString.notification),
                trailing: Observer(
                  builder: (context) {
                    return Switch(
                      onChanged: (value) async {
                        if (!await store.notification.isPermanentlyDenied) {
                          openAppSettings();
                          return;
                        }
                        if (store.notificationStatus.value) {
                          openAppSettings();
                        } else {
                          await store.notification.request().then((value) {
                            if (value.isGranted || value.isLimited) {
                              store.notificationStatus = Observable(true);
                            }
                          });
                        }
                      },
                      value: store.notificationStatus.value,
                    );
                  },
                ),
              ),
              ListTile(
                title: const Text(AppString.location),
                trailing: Observer(
                  builder: (context) {
                    return Switch(
                      onChanged: (value) async {
                        if (await store.location.isPermanentlyDenied) {
                          openAppSettings();
                          return;
                        }
                        if (store.locationAlwaysStatus.value ||
                            store.locationStatus.value) {
                          openAppSettings();
                        } else {
                          await store.location.request().then((value) {
                            if (value.isGranted || value.isLimited) {
                              store.locationStatus = Observable(true);
                            }
                          });
                          await Future.delayed(
                              const Duration(milliseconds: 500), () async {
                            if (await store.location.isGranted) {
                              await store.locationAlways
                                  .request()
                                  .then((value) {
                                if (value.isGranted) {
                                  store.locationAlwaysStatus = Observable(true);
                                }
                              });
                            }
                          });
                        }
                      },
                      value: store.locationAlwaysStatus.value
                          ? store.locationAlwaysStatus.value
                          : store.locationStatus.value,
                    );
                  },
                ),
              ),
              ListTile(
                title: const Text(AppString.storage),
                trailing: Observer(
                  builder: (context) {
                    return Switch(
                      onChanged: (value) async {
                        if (await store.storage.isPermanentlyDenied) {
                          openAppSettings();
                          return;
                        }
                        if (store.storageStatus.value) {
                          openAppSettings();
                        } else {
                          await store.storage.request().then((value) {
                            if (value.isGranted || value.isLimited) {
                              store.storageStatus = Observable(true);
                            }
                          });
                        }
                      },
                      value: store.storageStatus.value,
                    );
                  },
                ),
              ),
              const ListTile(
                title: Text(AppString.aboutapp),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ],
          )),
          Container(
            child: dbPref.isLogin
                ? SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                            onPressed: () async {
                              setState(() {
                                dbPref.logout();
                              });
                            },
                            child: const Text(AppString.logout))
                      ],
                    ),
                  )
                : Column(
                    children: [
                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                                onPressed: () async {
                                  bool chkLog = await (Navigator.pushNamed(
                                      context, AppRoutes.login)) as bool;
                                  if (chkLog) {
                                    setState(() {
                                      curUser = jsonDecode(dbPref
                                          .sharedPreferences
                                          .getString("currentUser")!);
                                    });
                                  }
                                },
                                child: const Text(AppString.login))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, AppRoutes.signup);
                                },
                                child: const Text(AppString.signup))
                          ],
                        ),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
