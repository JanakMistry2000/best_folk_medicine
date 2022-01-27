import 'package:flutter/cupertino.dart';

import '../colors.dart';
import '../strings.dart';
import 'package:flutter/material.dart';

class Shop extends StatefulWidget {
  const Shop({Key? key}) : super(key: key);

  @override
  _ShopState createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(0, 35, 0, 0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: const [
                Text(
                  AppString.shop,
                  style: TextStyle(fontSize: 30),
                ),
              ],
            ),
          ),
          Expanded(
            child: DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    Container(
                      color: AppColor.greyBlue,
                      width: double.infinity,
                      height: 50,
                      child: const TabBar(
                        labelColor: AppColor.black,
                        unselectedLabelColor: AppColor.grey,
                        tabs: [
                          Text(AppString.android,
                              style: TextStyle(fontFamily: 'Roboto')),
                          Text(AppString.ios,
                              style: TextStyle(fontFamily: 'SF')),
                        ],
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        width: double.infinity,
                        height: double.infinity,
                        child: TabBarView(children: [
                          Center(
                            child: Column(
                              children: [
                                ElevatedButton(
                                    onPressed: () => showDialog(
                                        barrierDismissible: false,
                                        context: context,
                                        builder: (BuildContext context) =>
                                            AlertDialog(
                                              title: const Text(
                                                  AppString.termConditions,
                                                  style: TextStyle(
                                                      fontFamily: 'Roboto')),
                                              content: const Text(
                                                  AppString.termconditionMeg,
                                                  style: TextStyle(
                                                      fontFamily: 'Roboto')),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(context,
                                                          AppString.no),
                                                  child: const Text(
                                                      AppString.no,
                                                      style: TextStyle(
                                                          fontFamily:
                                                              'Roboto')),
                                                ),
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(context,
                                                          AppString.accept),
                                                  child: const Text(
                                                      AppString.accept,
                                                      style: TextStyle(
                                                          fontFamily:
                                                              'Roboto')),
                                                ),
                                              ],
                                            )),
                                    child: const Text(AppString.alertDailog,
                                        style:
                                            TextStyle(fontFamily: 'Roboto'))),
                                ElevatedButton(
                                    onPressed: () => showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            SimpleDialog(
                                              title: const Text(
                                                  AppString.selectAcount,
                                                  style: TextStyle(
                                                      fontFamily: 'Roboto')),
                                              children: [
                                                Row(
                                                  children: [
                                                    Container(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              15),
                                                      height: 70,
                                                      child: TextButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context,
                                                              AppString
                                                                  .account1);
                                                        },
                                                        child: const Text(
                                                            AppString.account1,
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'Roboto')),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Container(
                                                      height: 70,
                                                      padding:
                                                          const EdgeInsets.all(
                                                              15),
                                                      child: TextButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context,
                                                              AppString
                                                                  .account2);
                                                        },
                                                        child: const Text(
                                                            AppString.account2,
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'Roboto')),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            )),
                                    child: const Text(AppString.simpleDialog)),
                                ElevatedButton(
                                    onPressed: () => showModalBottomSheet(
                                        context: context,
                                        barrierColor: Colors.transparent,
                                        builder: (BuildContext context) =>
                                            Container(
                                              height: 400,
                                              decoration: BoxDecoration(
                                                  color: AppColor.white,
                                                  boxShadow: const [
                                                    BoxShadow(
                                                      color: AppColor.grey,
                                                      blurRadius: 10,
                                                      spreadRadius: 1,
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25)),
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            15.0),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: const [
                                                        Text(
                                                          AppString
                                                              .selectOption,
                                                          style: TextStyle(
                                                              fontSize: 20,
                                                              fontFamily:
                                                                  'Roboto'),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: ListView(
                                                      children: [
                                                        SizedBox(
                                                          height: 50,
                                                          width:
                                                              double.infinity,
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              TextButton(
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.pop(
                                                                        context,
                                                                        "");
                                                                  },
                                                                  child: const Text(
                                                                      AppString
                                                                          .settings,
                                                                      style: TextStyle(
                                                                          fontFamily:
                                                                              'Roboto')))
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 50,
                                                          width:
                                                              double.infinity,
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              TextButton(
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.pop(
                                                                        context,
                                                                        "");
                                                                  },
                                                                  child: const Text(
                                                                      AppString
                                                                          .aboutapp,
                                                                      style: TextStyle(
                                                                          fontFamily:
                                                                              'Roboto')))
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            15.0),
                                                    child: SizedBox(
                                                      height: 50,
                                                      width: double.infinity,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          TextButton(
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    context,
                                                                    "");
                                                              },
                                                              child: const Text(
                                                                AppString
                                                                    .cancel,
                                                                style: TextStyle(
                                                                    color:
                                                                        AppColor
                                                                            .red,
                                                                    fontFamily:
                                                                        'Roboto'),
                                                              ))
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )),
                                    child: const Text(AppString.bottomSheet,
                                        style:
                                            TextStyle(fontFamily: 'Roboto'))),
                              ],
                            ),
                          ),
                          Center(
                            child: Column(
                              children: [
                                ElevatedButton(
                                    onPressed: () => showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            CupertinoAlertDialog(
                                              title: const Text(
                                                  AppString.termConditions,
                                                  style: TextStyle(
                                                      fontFamily: 'SF')),
                                              content: const Text(
                                                  AppString.termconditionMeg,
                                                  style: TextStyle(
                                                      fontFamily: 'SF')),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(context,
                                                          AppString.no),
                                                  child: const Text(
                                                      AppString.no,
                                                      style: TextStyle(
                                                          fontFamily: 'SF')),
                                                ),
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(context,
                                                          AppString.accept),
                                                  child: const Text(
                                                      AppString.accept,
                                                      style: TextStyle(
                                                          fontFamily: 'SF')),
                                                ),
                                              ],
                                            )),
                                    child: const Text(AppString.cupertinoAlert,
                                        style: TextStyle(fontFamily: 'SF'))),
                                ElevatedButton(
                                    onPressed: () => showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            CupertinoAlertDialog(
                                              title: const Text(
                                                  AppString.selectAcount,
                                                  style: TextStyle(
                                                      fontFamily: 'SF')),
                                              content: Container(
                                                margin:
                                                    const EdgeInsets.all(15),
                                                height: 300,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                child: ListView(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Container(
                                                          height: 70,
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(0),
                                                          child: TextButton(
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context,
                                                                  AppString
                                                                      .account1);
                                                            },
                                                            child: const Text(
                                                                AppString
                                                                    .account1,
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        'SF')),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Container(
                                                          height: 70,
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(0),
                                                          child: TextButton(
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context,
                                                                  AppString
                                                                      .account2);
                                                            },
                                                            child: const Text(
                                                                AppString
                                                                    .account2,
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        'SF')),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context,
                                                        AppString.cancel);
                                                  },
                                                  child: const Text(
                                                      AppString.cancel,
                                                      style: TextStyle(
                                                          fontFamily: 'SF')),
                                                ),
                                              ],
                                            )),
                                    child: const Text(AppString.cupertinoDialog,
                                        style: TextStyle(fontFamily: 'SF'))),
                                ElevatedButton(
                                    onPressed: () => showCupertinoModalPopup(
                                        barrierDismissible: false,
                                        context: context,
                                        builder: (BuildContext context) =>
                                            CupertinoActionSheet(
                                              title: const Text(
                                                  AppString.selectAcount,
                                                  style: TextStyle(
                                                      fontFamily: 'SF')),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(context,
                                                          AppString.account1),
                                                  child: const Text(
                                                      AppString.account1,
                                                      style: TextStyle(
                                                          fontFamily: 'SF')),
                                                ),
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(context,
                                                          AppString.account2),
                                                  child: const Text(
                                                      AppString.account2,
                                                      style: TextStyle(
                                                          fontFamily: 'SF')),
                                                ),
                                              ],
                                              cancelButton:
                                                  CupertinoActionSheetAction(
                                                onPressed: () => Navigator.pop(
                                                    context, AppString.cancel),
                                                child: const Text(
                                                  AppString.cancel,
                                                  style: TextStyle(
                                                      color: AppColor.red,
                                                      fontFamily: 'SF'),
                                                ),
                                              ),
                                            )),
                                    child: const Text(
                                        AppString.cupertinoActionSheet,
                                        style: TextStyle(fontFamily: 'SF'))),
                              ],
                            ),
                          ),
                        ]),
                      ),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
