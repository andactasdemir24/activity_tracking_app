// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_post_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AddPostsViewModel on _AddPostsViewModelBase, Store {
  late final _$postIdAtom =
      Atom(name: '_AddPostsViewModelBase.postId', context: context);

  @override
  String? get postId {
    _$postIdAtom.reportRead();
    return super.postId;
  }

  @override
  set postId(String? value) {
    _$postIdAtom.reportWrite(value, super.postId, () {
      super.postId = value;
    });
  }

  late final _$pickerAtom =
      Atom(name: '_AddPostsViewModelBase.picker', context: context);

  @override
  ImagePicker get picker {
    _$pickerAtom.reportRead();
    return super.picker;
  }

  @override
  set picker(ImagePicker value) {
    _$pickerAtom.reportWrite(value, super.picker, () {
      super.picker = value;
    });
  }

  late final _$imageFileAtom =
      Atom(name: '_AddPostsViewModelBase.imageFile', context: context);

  @override
  XFile? get imageFile {
    _$imageFileAtom.reportRead();
    return super.imageFile;
  }

  @override
  set imageFile(XFile? value) {
    _$imageFileAtom.reportWrite(value, super.imageFile, () {
      super.imageFile = value;
    });
  }

  late final _$timeAtom =
      Atom(name: '_AddPostsViewModelBase.time', context: context);

  @override
  Timestamp? get time {
    _$timeAtom.reportRead();
    return super.time;
  }

  @override
  set time(Timestamp? value) {
    _$timeAtom.reportWrite(value, super.time, () {
      super.time = value;
    });
  }

  late final _$nameControllerAtom =
      Atom(name: '_AddPostsViewModelBase.nameController', context: context);

  @override
  TextEditingController get nameController {
    _$nameControllerAtom.reportRead();
    return super.nameController;
  }

  @override
  set nameController(TextEditingController value) {
    _$nameControllerAtom.reportWrite(value, super.nameController, () {
      super.nameController = value;
    });
  }

  late final _$locationControllerAtom =
      Atom(name: '_AddPostsViewModelBase.locationController', context: context);

  @override
  TextEditingController get locationController {
    _$locationControllerAtom.reportRead();
    return super.locationController;
  }

  @override
  set locationController(TextEditingController value) {
    _$locationControllerAtom.reportWrite(value, super.locationController, () {
      super.locationController = value;
    });
  }

  late final _$moneyControllerAtom =
      Atom(name: '_AddPostsViewModelBase.moneyController', context: context);

  @override
  TextEditingController get moneyController {
    _$moneyControllerAtom.reportRead();
    return super.moneyController;
  }

  @override
  set moneyController(TextEditingController value) {
    _$moneyControllerAtom.reportWrite(value, super.moneyController, () {
      super.moneyController = value;
    });
  }

  late final _$imageUrlAtom =
      Atom(name: '_AddPostsViewModelBase.imageUrl', context: context);

  @override
  String? get imageUrl {
    _$imageUrlAtom.reportRead();
    return super.imageUrl;
  }

  @override
  set imageUrl(String? value) {
    _$imageUrlAtom.reportWrite(value, super.imageUrl, () {
      super.imageUrl = value;
    });
  }

  late final _$isImageSelectedAtom =
      Atom(name: '_AddPostsViewModelBase.isImageSelected', context: context);

  @override
  bool get isImageSelected {
    _$isImageSelectedAtom.reportRead();
    return super.isImageSelected;
  }

  @override
  set isImageSelected(bool value) {
    _$isImageSelectedAtom.reportWrite(value, super.isImageSelected, () {
      super.isImageSelected = value;
    });
  }

  late final _$pickImageAsyncAction =
      AsyncAction('_AddPostsViewModelBase.pickImage', context: context);

  @override
  Future<void> pickImage() {
    return _$pickImageAsyncAction.run(() => super.pickImage());
  }

  late final _$selectTimeAsyncAction =
      AsyncAction('_AddPostsViewModelBase.selectTime', context: context);

  @override
  Future<void> selectTime(BuildContext context) {
    return _$selectTimeAsyncAction.run(() => super.selectTime(context));
  }

  late final _$addPostAsyncAction =
      AsyncAction('_AddPostsViewModelBase.addPost', context: context);

  @override
  Future<void> addPost(BuildContext context) {
    return _$addPostAsyncAction.run(() => super.addPost(context));
  }

  late final _$_AddPostsViewModelBaseActionController =
      ActionController(name: '_AddPostsViewModelBase', context: context);

  @override
  void reset() {
    final _$actionInfo = _$_AddPostsViewModelBaseActionController.startAction(
        name: '_AddPostsViewModelBase.reset');
    try {
      return super.reset();
    } finally {
      _$_AddPostsViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
postId: ${postId},
picker: ${picker},
imageFile: ${imageFile},
time: ${time},
nameController: ${nameController},
locationController: ${locationController},
moneyController: ${moneyController},
imageUrl: ${imageUrl},
isImageSelected: ${isImageSelected}
    ''';
  }
}
