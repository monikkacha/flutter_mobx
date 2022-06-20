// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ApiStore on Api, Store {
  Computed<bool>? _$loadingMoreDataComputed;

  @override
  bool get loadingMoreData =>
      (_$loadingMoreDataComputed ??= Computed<bool>(() => super.loadingMoreData,
              name: 'Api.loadingMoreData'))
          .value;

  late final _$listAtom = Atom(name: 'Api.list', context: context);

  @override
  List<CategoryResponse> get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(List<CategoryResponse> value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  late final _$isLoadingAtom = Atom(name: 'Api.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$isLoadingMoreDataAtom =
      Atom(name: 'Api.isLoadingMoreData', context: context);

  @override
  bool get isLoadingMoreData {
    _$isLoadingMoreDataAtom.reportRead();
    return super.isLoadingMoreData;
  }

  @override
  set isLoadingMoreData(bool value) {
    _$isLoadingMoreDataAtom.reportWrite(value, super.isLoadingMoreData, () {
      super.isLoadingMoreData = value;
    });
  }

  late final _$fetchDataAsyncAction =
      AsyncAction('Api.fetchData', context: context);

  @override
  Future<void> fetchData() {
    return _$fetchDataAsyncAction.run(() => super.fetchData());
  }

  late final _$fetchMoreDataAsyncAction =
      AsyncAction('Api.fetchMoreData', context: context);

  @override
  Future<void> fetchMoreData() {
    return _$fetchMoreDataAsyncAction.run(() => super.fetchMoreData());
  }

  @override
  String toString() {
    return '''
list: ${list},
isLoading: ${isLoading},
isLoadingMoreData: ${isLoadingMoreData},
loadingMoreData: ${loadingMoreData}
    ''';
  }
}
