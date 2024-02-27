// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeViewModel on _HomeViewModelBase, Store {
  late final _$likesMapAtom =
      Atom(name: '_HomeViewModelBase.likesMap', context: context);

  @override
  ObservableMap<String, bool> get likesMap {
    _$likesMapAtom.reportRead();
    return super.likesMap;
  }

  @override
  set likesMap(ObservableMap<String, bool> value) {
    _$likesMapAtom.reportWrite(value, super.likesMap, () {
      super.likesMap = value;
    });
  }

  late final _$imageUrlsAtom =
      Atom(name: '_HomeViewModelBase.imageUrls', context: context);

  @override
  List<String> get imageUrls {
    _$imageUrlsAtom.reportRead();
    return super.imageUrls;
  }

  @override
  set imageUrls(List<String> value) {
    _$imageUrlsAtom.reportWrite(value, super.imageUrls, () {
      super.imageUrls = value;
    });
  }

  late final _$sliderListAsyncAction =
      AsyncAction('_HomeViewModelBase.sliderList', context: context);

  @override
  Future<List<String>> sliderList() {
    return _$sliderListAsyncAction.run(() => super.sliderList());
  }

  late final _$_HomeViewModelBaseActionController =
      ActionController(name: '_HomeViewModelBase', context: context);

  @override
  void toggleLikeStatus(String postId) {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase.toggleLikeStatus');
    try {
      return super.toggleLikeStatus(postId);
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String formatTimestamp(Timestamp timestamp) {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase.formatTimestamp');
    try {
      return super.formatTimestamp(timestamp);
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
likesMap: ${likesMap},
imageUrls: ${imageUrls}
    ''';
  }
}
