import 'package:best_folk_medicine/database/database_sharedpreferences.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../strings.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late DatabaseSharedPreferences dbPref;
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> loginForm = GlobalKey();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    dbPref = Provider.of<DatabaseSharedPreferences>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
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
                    AppString.login,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
            Expanded(
              child: Form(
                key: loginForm,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 70,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: AutofillHints.username,
                        ),
                        controller: username,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return AppString.enterUsername;
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: 70,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: AutofillHints.password,
                        ),
                        controller: password,
                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return AppString.enterPassword;
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: ElevatedButton(
                        child: const Text(AppString.login,
                            style: TextStyle(fontSize: 20)),
                        onPressed: () {
                          if (loginForm.currentState!.validate()) {
                            bool log =
                                dbPref.login(username.text, password.text);
                            if (log) {
                              Navigator.pop(context, log);
                            }
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
