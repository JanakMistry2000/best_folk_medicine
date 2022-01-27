import 'package:best_folk_medicine/flavor_config.dart';
import 'package:chopper/chopper.dart';
import 'package:mobx/mobx.dart';

import '../apis/api_services.dart';
import '../models/articles_model.dart';
import '../utils.dart';

part 'mobx_store.g.dart';

class MobxStore = _MobxStore with _$MobxStore;

abstract class _MobxStore with Store {
  ArticleApiService services;
  ReactionDisposer? dispose;
  _MobxStore(this.services) {
    if (FlavorConfig.isLive()) {
      setupReactions();
    }
  }

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
  void setupReactions() {
    otherArticleData =
        ObservableFuture(services.getSimilarArticle('bbc.co.uk', 2));
    dispose = reaction((_) => pageno.value, (int newPageNo) {
      otherArticleData =
          ObservableFuture(services.getSimilarArticle('bbc.co.uk', newPageNo));
    });
  }

  @action
  void incPage() {
    pageno = Observable(pageno.value + 1);
  }

  @action
  void setPage(int num) {
    pageno = Observable(num);
  }
}
