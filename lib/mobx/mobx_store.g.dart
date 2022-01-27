// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mobx_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MobxStore on _MobxStore, Store {
  final _$manageExternalStorageStatusAtom =
      Atom(name: '_MobxStore.manageExternalStorageStatus');

  @override
  Observable<bool> get manageExternalStorageStatus {
    _$manageExternalStorageStatusAtom.reportRead();
    return super.manageExternalStorageStatus;
  }

  @override
  set manageExternalStorageStatus(Observable<bool> value) {
    _$manageExternalStorageStatusAtom
        .reportWrite(value, super.manageExternalStorageStatus, () {
      super.manageExternalStorageStatus = value;
    });
  }

  final _$locationStatusAtom = Atom(name: '_MobxStore.locationStatus');

  @override
  Observable<bool> get locationStatus {
    _$locationStatusAtom.reportRead();
    return super.locationStatus;
  }

  @override
  set locationStatus(Observable<bool> value) {
    _$locationStatusAtom.reportWrite(value, super.locationStatus, () {
      super.locationStatus = value;
    });
  }

  final _$locationAlwaysStatusAtom =
      Atom(name: '_MobxStore.locationAlwaysStatus');

  @override
  Observable<bool> get locationAlwaysStatus {
    _$locationAlwaysStatusAtom.reportRead();
    return super.locationAlwaysStatus;
  }

  @override
  set locationAlwaysStatus(Observable<bool> value) {
    _$locationAlwaysStatusAtom.reportWrite(value, super.locationAlwaysStatus,
        () {
      super.locationAlwaysStatus = value;
    });
  }

  final _$storageStatusAtom = Atom(name: '_MobxStore.storageStatus');

  @override
  Observable<bool> get storageStatus {
    _$storageStatusAtom.reportRead();
    return super.storageStatus;
  }

  @override
  set storageStatus(Observable<bool> value) {
    _$storageStatusAtom.reportWrite(value, super.storageStatus, () {
      super.storageStatus = value;
    });
  }

  final _$notificationStatusAtom = Atom(name: '_MobxStore.notificationStatus');

  @override
  Observable<bool> get notificationStatus {
    _$notificationStatusAtom.reportRead();
    return super.notificationStatus;
  }

  @override
  set notificationStatus(Observable<bool> value) {
    _$notificationStatusAtom.reportWrite(value, super.notificationStatus, () {
      super.notificationStatus = value;
    });
  }

  final _$localresultAtom = Atom(name: '_MobxStore.localresult');

  @override
  ObservableFuture<List<Articles>>? get localresult {
    _$localresultAtom.reportRead();
    return super.localresult;
  }

  @override
  set localresult(ObservableFuture<List<Articles>>? value) {
    _$localresultAtom.reportWrite(value, super.localresult, () {
      super.localresult = value;
    });
  }

  final _$localDataAtom = Atom(name: '_MobxStore.localData');

  @override
  ObservableList<Articles>? get localData {
    _$localDataAtom.reportRead();
    return super.localData;
  }

  @override
  set localData(ObservableList<Articles>? value) {
    _$localDataAtom.reportWrite(value, super.localData, () {
      super.localData = value;
    });
  }

  final _$pagenoAtom = Atom(name: '_MobxStore.pageno');

  @override
  Observable<int> get pageno {
    _$pagenoAtom.reportRead();
    return super.pageno;
  }

  @override
  set pageno(Observable<int> value) {
    _$pagenoAtom.reportWrite(value, super.pageno, () {
      super.pageno = value;
    });
  }

  final _$otherArticleDataAtom = Atom(name: '_MobxStore.otherArticleData');

  @override
  ObservableFuture<Response<ResponseData>>? get otherArticleData {
    _$otherArticleDataAtom.reportRead();
    return super.otherArticleData;
  }

  @override
  set otherArticleData(ObservableFuture<Response<ResponseData>>? value) {
    _$otherArticleDataAtom.reportWrite(value, super.otherArticleData, () {
      super.otherArticleData = value;
    });
  }

  final _$generalArticleDataAtom = Atom(name: '_MobxStore.generalArticleData');

  @override
  ObservableFuture<Response<ResponseData>>? get generalArticleData {
    _$generalArticleDataAtom.reportRead();
    return super.generalArticleData;
  }

  @override
  set generalArticleData(ObservableFuture<Response<ResponseData>>? value) {
    _$generalArticleDataAtom.reportWrite(value, super.generalArticleData, () {
      super.generalArticleData = value;
    });
  }

  final _$topHeadingsAtom = Atom(name: '_MobxStore.topHeadings');

  @override
  ObservableFuture<Response<ResponseData>>? get topHeadings {
    _$topHeadingsAtom.reportRead();
    return super.topHeadings;
  }

  @override
  set topHeadings(ObservableFuture<Response<ResponseData>>? value) {
    _$topHeadingsAtom.reportWrite(value, super.topHeadings, () {
      super.topHeadings = value;
    });
  }

  final _$getDataAsyncAction = AsyncAction('_MobxStore.getData');

  @override
  Future<dynamic> getData(String query, {int pageno = 1}) {
    return _$getDataAsyncAction.run(() => super.getData(query, pageno: pageno));
  }

  final _$getMockDataAsyncAction = AsyncAction('_MobxStore.getMockData');

  @override
  Future<dynamic> getMockData() {
    return _$getMockDataAsyncAction.run(() => super.getMockData());
  }

  final _$getHeadLinesAsyncAction = AsyncAction('_MobxStore.getHeadLines');

  @override
  Future<dynamic> getHeadLines() {
    return _$getHeadLinesAsyncAction.run(() => super.getHeadLines());
  }

  final _$_MobxStoreActionController = ActionController(name: '_MobxStore');

  @override
  void incPage() {
    final _$actionInfo =
        _$_MobxStoreActionController.startAction(name: '_MobxStore.incPage');
    try {
      return super.incPage();
    } finally {
      _$_MobxStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addArticleToLocal(Articles articles) {
    final _$actionInfo = _$_MobxStoreActionController.startAction(
        name: '_MobxStore.addArticleToLocal');
    try {
      return super.addArticleToLocal(articles);
    } finally {
      _$_MobxStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPage(int num) {
    final _$actionInfo =
        _$_MobxStoreActionController.startAction(name: '_MobxStore.setPage');
    try {
      return super.setPage(num);
    } finally {
      _$_MobxStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
manageExternalStorageStatus: ${manageExternalStorageStatus},
locationStatus: ${locationStatus},
locationAlwaysStatus: ${locationAlwaysStatus},
storageStatus: ${storageStatus},
notificationStatus: ${notificationStatus},
localresult: ${localresult},
localData: ${localData},
pageno: ${pageno},
otherArticleData: ${otherArticleData},
generalArticleData: ${generalArticleData},
topHeadings: ${topHeadings}
    ''';
  }
}
