import 'package:best_folk_medicine/database/database_sharedpreferences.dart';
import 'package:best_folk_medicine/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../strings.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late DatabaseSharedPreferences dbPref;
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController contact = TextEditingController();
  GlobalKey<FormState> signupForm = GlobalKey();

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
                    AppString.signup,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
            Expanded(
              child: Form(
                key: signupForm,
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
                        validator: (value) {
                          if (value!.isEmpty) {
                            return AppString.enterPassword;
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: 70,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: AutofillHints.email,
                        ),
                        controller: email,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return AppString.enterEmail;
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: 70,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: AppString.contact,
                        ),
                        controller: contact,
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return AppString.enterContact;
                          } else if (value.length < 10 || value.length > 10) {
                            return AppString.enterContact;
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: ElevatedButton(
                        child: const Text(AppString.signup,
                            style: TextStyle(fontSize: 20)),
                        onPressed: () {
                          if (signupForm.currentState!.validate()) {
                            int li =
                                dbPref.sharedPreferences.getInt("lastIndex")!;
                            User usr = User(
                                id: li + 1,
                                name: username.text,
                                contact: contact.text,
                                email: email.text,
                                password: password.text);
                            dbPref.addUser(usr);
                            dbPref.sharedPreferences
                                .setInt('lastIndex', li + 1);
                            Navigator.pop(context, true);
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
