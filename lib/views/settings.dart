import '../strings.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool notifications = false;

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
          SizedBox(
            height: 50,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(onPressed: () {}, child: const Text(AppString.login))
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
                    onPressed: () {}, child: const Text(AppString.signup))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
