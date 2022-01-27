import 'dart:convert';

import 'package:best_folk_medicine/database/database_sharedpreferences.dart';
import 'package:best_folk_medicine/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
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
                trailing: Switch(
                  onChanged: (value) {
                    setState(() {
                      notifications = !notifications;
                    });
                  },
                  value: notifications,
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
