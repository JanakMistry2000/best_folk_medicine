import 'package:flutter/material.dart';

import '../colors.dart';
import '../flavor_config.dart';
import '../routes.dart';
import '../strings.dart';
import '../utils.dart';

class SetTheme extends StatefulWidget {
  const SetTheme({Key? key}) : super(key: key);

  @override
  _SetThemeState createState() => _SetThemeState();
}

class _SetThemeState extends State<SetTheme> {
  Color bgcolor = AppColor.white;
  String dropdownvalue = 'Default';

  Map itemcolor = {
    'Default': AppColor.black,
    'Red': AppColor.red,
    'Blue': AppColor.blue
  };

  var items = [
    'Default',
    'Blue',
    'Red',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: bgcolor,
        child: Center(
          child: Container(
            decoration: BoxDecoration(
                color: AppColor.white, borderRadius: BorderRadius.circular(20)),
            height: 300,
            width: MediaQuery.of(context).size.width * 0.9,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      AppString.selectcolor,
                      style: TextStyle(fontSize: 25),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: DropdownButton(
                    value: dropdownvalue,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (newValue) async {
                      setState(() {
                        Utils.dprint(dropdownvalue);
                        FlavorConfig.instance.flavorColor.primarycolor =
                            itemcolor[newValue];
                        FlavorConfig.instance.flavorColor.primarylight =
                            itemcolor[newValue];
                        FlavorConfig.instance.flavorColor.titlecolor =
                            itemcolor[newValue];
                        bgcolor = itemcolor[newValue];
                        dropdownvalue = newValue.toString();
                      });
                    },
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              FlavorConfig.instance.flavorColor.primarycolor)),
                      onPressed: () async {
                        setState(() {
                          Navigator.pushReplacementNamed(
                              context, AppRoutes.homepage);
                        });
                      },
                      child: const Text(AppString.next)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
