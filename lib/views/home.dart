import 'package:flutter/material.dart';

import '../components/cateory_box.dart';
import '../components/custom_searchbar.dart';
import '../flavor_config.dart';
import '../routes.dart';
import '../strings.dart';
import '../utils.dart';
import 'main_articles.dart';
import 'other_articles.dart';
import 'top_heading.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppString.appname +
                      (FlavorConfig.isLive()
                          ? ''
                          : FlavorConfig.instance.flavor.toString()),
                  style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                      color: FlavorConfig.instance.flavorColor.titlecolor),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomSearchBar(),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 60,
              width: MediaQuery.of(context).size.width,
              child: FutureBuilder(
                future: Utils.getCategory(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return CategoryBox(dataModel: snapshot.data[index]);
                      },
                    );
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(AppString.mainArticle,
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.showall);
                      },
                      child: const Text(AppString.seeMore))
                ],
              ),
            ),

            /// Top Heading articles
            const TopHeading(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    AppString.notFinished,
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.showall);
                      },
                      child: const Text(AppString.seeMore))
                ],
              ),
            ),

            ///Main Articles
            const MainArticles(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(AppString.lastArticle,
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.showall);
                      },
                      child: const Text(AppString.seeMore))
                ],
              ),
            ),

            ///Other Articles
            const OtherArticles(onhome: true)
          ],
        ),
      ),
    );
  }
}
