import 'package:chopper/chopper.dart';
import 'package:mobx/mobx.dart';

import '../apis/api_services.dart';
import '../database/database_helper.dart';
import '../database/database_hive.dart';
import '../database/database_moor.dart';
import '../flavor_config.dart';
import '../models/articles_model.dart';
import '../utils.dart';

part 'mobx_store.g.dart';

class MobxStore = _MobxStore with _$MobxStore;

abstract class _MobxStore with Store {
  ArticleApiService services;
  ReactionDisposer? dispose;
  DatabaseHive dHive = DatabaseHive();

  _MobxStore(this.services) {
    setupReactions();
  }

  @observable
  ObservableFuture<List<Articles>>? localresult;

  @observable
  ObservableList<Articles>? localData;

  /// For page number of article in other article
  @observable
  Observable<int> pageno = Observable(0);

  /// For similar article section
  @observable
  ObservableFuture<Response<ResponseData>>? otherArticleData;

  @observable
  ObservableFuture<Response<ResponseData>>? generalArticleData;

  @observable
  ObservableFuture<Response<ResponseData>>? topHeadings;

  @action
  Future getData(String query, {int pageno = 1}) async {
    generalArticleData =
        ObservableFuture(services.getEverything(query, pageno));
  }

  @action
  Future getMockData() async {
    topHeadings = ObservableFuture(Utils.getArticles());
    generalArticleData = ObservableFuture(Utils.getArticles());
    otherArticleData = ObservableFuture(Utils.getArticles());
  }

  @action
  Future getHeadLines() async {
    topHeadings = ObservableFuture(services.getHeadlines());
  }

  /// Load new page every time we open article from similar article section
  void setupReactions() async {
    switch (FlavorConfig.instance.flavor) {

      ///loading localdata in store for dev flavor
      case Flavor.DEV:
        localresult =
            ObservableFuture(Future.delayed(const Duration(seconds: 0), () {
          return dHive.getAllData();
        }));
        localData = ObservableList.of(dHive.getAllData());
        break;

      ///loading localdata from sqlite to store for live flavor
      case Flavor.LIVE:

        ///setting up reaction for otherarticles.
        otherArticleData =
            ObservableFuture(services.getSimilarArticle('bbc.co.uk', 2));
        dispose = reaction((_) => pageno.value, (int newPageNo) {
          otherArticleData = ObservableFuture(
              services.getSimilarArticle('bbc.co.uk', newPageNo));
        });
        var art = DatabaseHelper.instance.getAllArticles();
        localresult = ObservableFuture(art.asObservable());
        final res = await art;
        localData = ObservableList.of(res);
        break;

      ///loading localdata from moor to store for QA flavor
      case Flavor.QA:

        ///setting up reaction for otherarticles.
        otherArticleData =
            ObservableFuture(services.getSimilarArticle('bbc.co.uk', 2));
        dispose = reaction((_) => pageno.value, (int newPageNo) {
          otherArticleData = ObservableFuture(
              services.getSimilarArticle('bbc.co.uk', newPageNo));
        });
        List<Articles> arts = [];
        var moorArticles = await DatabaseMoor().getAllArticle();
        for (var element in moorArticles) {
          arts.add(Articles.fromMoor(element));
        }
        localresult = ObservableFuture(Future.value(arts));
        localData = ObservableList.of(arts);
        break;
    }
  }

  /// To change page no for other article section
  @action
  void incPage() {
    pageno = Observable(pageno.value + 1);
  }

  @action
  void addArticleToLocal(Articles articles) {
    localData!.add(articles);
  }

  void deleteArticleFromLocal(int ids) {
    switch (FlavorConfig.instance.flavor) {
      case Flavor.DEV:
        localData!.removeAt(ids);
        break;
      case Flavor.LIVE:
        localData!.removeWhere((element) => element.id == ids);
        break;
      case Flavor.QA:
        localData!.removeWhere((element) => element.id == ids);
        break;
    }
  }

  /// Set page number for other articles section
  @action
  void setPage(int num) {
    pageno = Observable(num);
  }
}
