// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MainViewModel on _MainViewModelBase, Store {
  late final _$selectedIndexAtom =
      Atom(name: '_MainViewModelBase.selectedIndex', context: context);

  @override
  int get selectedIndex {
    _$selectedIndexAtom.reportRead();
    return super.selectedIndex;
  }

  @override
  set selectedIndex(int value) {
    _$selectedIndexAtom.reportWrite(value, super.selectedIndex, () {
      super.selectedIndex = value;
    });
  }

  late final _$_MainViewModelBaseActionController =
      ActionController(name: '_MainViewModelBase', context: context);

  @override
  void onItemTapped(int index) {
    final _$actionInfo = _$_MainViewModelBaseActionController.startAction(
        name: '_MainViewModelBase.onItemTapped');
    try {
      return super.onItemTapped(index);
    } finally {
      _$_MainViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Widget buildBodyContent(int index, BuildContext context) {
    final _$actionInfo = _$_MainViewModelBaseActionController.startAction(
        name: '_MainViewModelBase.buildBodyContent');
    try {
      return super.buildBodyContent(index, context);
    } finally {
      _$_MainViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedIndex: ${selectedIndex}
    ''';
  }
}
