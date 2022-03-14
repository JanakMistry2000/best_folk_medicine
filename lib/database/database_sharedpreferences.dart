import 'dart:convert';

import 'package:best_folk_medicine/strings.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_model.dart';

class DatabaseSharedPreferences {
  late SharedPreferences sharedPreferences;

  bool isLogin = false;

  DatabaseSharedPreferences() {
    Future<SharedPreferences> sharedPreferences =
        SharedPreferences.getInstance();
    sharedPreferences.then((value) {
      this.sharedPreferences = value;
      if (!value.containsKey("lastIndex")) {
        value.setInt("lastIndex", 0);
      }
      if (!value.containsKey("users")) {
        value.setStringList("users", []);
      }
      if (!value.containsKey("login")) {
        value.setBool("login", false);
        isLogin = false;
      } else {
        isLogin = value.getBool("login")!;
      }
      if (!value.containsKey("currentUser")) {
        value.setString("currentUser", "");
      }
    });
  }

  addUser(User user) async {
    var data = jsonEncode(user.toJson());
    var usrs = sharedPreferences.getStringList("users");
    usrs?.add(data);
    sharedPreferences.setStringList("users", usrs!);
  }

  bool login(String email, String password) {
    var data = sharedPreferences.getStringList("users");
    List temp = [];
    data?.forEach((element) {
      temp.add(jsonDecode(element));
    });
    for (var element in temp) {
      if (element['email'] == email && element['password'] == password) {
        sharedPreferences.setString("currentUser", jsonEncode(element));
        sharedPreferences.setBool("login", true);
        isLogin = true;
        return true;
      }
    }
    Fluttertoast.showToast(
        msg: AppString.invalidCredential, toastLength: Toast.LENGTH_LONG);
    return false;
  }

  logout() {
    sharedPreferences.setString("currentUser", "");
    sharedPreferences.setBool("login", false);
    isLogin = false;
  }
}
