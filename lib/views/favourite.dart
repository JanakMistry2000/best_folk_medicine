import 'package:flutter/material.dart';

import '../strings.dart';

class Favourite extends StatefulWidget {
  const Favourite({Key? key}) : super(key: key);

  @override
  _FavouriteState createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
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
                  AppString.favourites,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
