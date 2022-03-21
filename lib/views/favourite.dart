import 'package:best_folk_medicine/components/article_tile_live.dart';
import 'package:best_folk_medicine/mobx/mobx_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import '../strings.dart';

class Favorite extends StatefulWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  late MobxStore store;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    store = Provider.of<MobxStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 35,
          ),
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              AppString.favourites,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              textAlign: TextAlign.left,
            ),
          ),
          Expanded(
            child: Observer(
              builder: (context) {
                switch (store.localresult?.status) {
                  case FutureStatus.pending:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  case FutureStatus.rejected:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  case FutureStatus.fulfilled:
                    return ListView.builder(
                      itemCount: store.localData!.length,
                      itemBuilder: (context, index) {
                        return ArticleTileLive(
                            dataModel: store.localData![index]);
                      },
                    );
                  default:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
