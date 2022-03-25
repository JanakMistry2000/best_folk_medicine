import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../colors.dart';
import '../flavor_config.dart';
import '../mobx/mobx_store.dart';
import '../strings.dart';
import 'animations.dart';
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
  bool toshow = true;
  late MobxStore store;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    store = Provider.of<MobxStore>(context);
  }

  final widgetOptions = [
    const Home(),
    const Shop(),
    const Animations(),
    const Favorite(),
    const Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Scaffold(
          body: IndexedStack(
            children: widgetOptions,
            index: store.selectedIndex,
          ),
          floatingActionButton: store.selectedIndex == 0
              ? (FlavorConfig.isLive() || FlavorConfig.isQA())
                  ? FloatingActionButton(
                      backgroundColor: AppColor.greyBlue,
                      foregroundColor: AppColor.black,
                      mini: true,
                      onPressed: () => store.onItemTap(1),
                      child: const Icon(Icons.arrow_forward_ios_outlined),
                    )
                  : null
              : null,
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.shifting,
            backgroundColor: Colors.white,
            selectedItemColor: FlavorConfig.instance.flavorColor.primarycolor,
            unselectedItemColor: FlavorConfig.instance.flavorColor.primarylight,
            currentIndex: store.selectedIndex,
            onTap: store.onItemTap,
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
                  icon: Icon(Icons.animation), label: AppString.animation),
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
      },
    );
  }
}
