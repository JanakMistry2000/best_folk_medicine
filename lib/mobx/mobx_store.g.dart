// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mobx_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MobxStore on _MobxStore, Store {
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
pageno: ${pageno},
otherArticleData: ${otherArticleData},
generalArticleData: ${generalArticleData},
topHeadings: ${topHeadings}
    ''';
  }
}
