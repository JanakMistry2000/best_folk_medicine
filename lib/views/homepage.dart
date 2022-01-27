import 'package:flutter/material.dart';

import '../colors.dart';
import '../flavor_config.dart';
import '../strings.dart';
import 'favourite.dart';
import 'home.dart';
import 'settings.dart';
import 'shop.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomepageState createState() => HomepageState();
}

class HomepageState extends State<HomePage> {
  int selectedIndex = 0;
  bool toshow = true;

  void onItemTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  final widgetOptions = [
    const Home(),
    const Shop(),
    const Favourite(),
    const Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        children: widgetOptions,
        index: selectedIndex,
      ),
      floatingActionButton: selectedIndex == 0
          ? FlavorConfig.isLive()
              ? FloatingActionButton(
                  backgroundColor: AppColor.greyBlue,
                  foregroundColor: AppColor.black,
                  mini: true,
                  onPressed: () {
                    setState(() {
                      selectedIndex = 1;
                    });
                  },
                  child: const Icon(Icons.arrow_forward_ios_outlined),
                )
              : null
          : null,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        backgroundColor: Colors.white,
        selectedItemColor: FlavorConfig.instance.flavorColor.primarycolor,
        unselectedItemColor: FlavorConfig.instance.flavorColor.primarylight,
        currentIndex: selectedIndex,
        onTap: onItemTap,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: AppString.home,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: AppString.store,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: AppString.favourites,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: AppString.settings,
          ),
        ],
      ),
    );
  }
}
