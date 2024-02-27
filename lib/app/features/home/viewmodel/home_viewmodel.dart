// ignore_for_file: library_private_types_in_public_api

import 'package:andac_case/app/core/service/storage_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
part 'home_viewmodel.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store {
  StorageService storageService = StorageService();

  @observable
  ObservableMap<String, bool> likesMap = ObservableMap<String, bool>();

  @observable
  List<String> imageUrls = [];

  @action
  void toggleLikeStatus(String postId) {
    if (likesMap.containsKey(postId)) {
      likesMap[postId] = !likesMap[postId]!;
    } else {
      likesMap[postId] = true;
    }
  }

  @action
  Future<List<String>> sliderList() async {
    ListResult result = await storageService.getImageUrls();
    for (var ref in result.items) {
      String imageUrl = await ref.getDownloadURL();
      imageUrls.add(imageUrl);
    }

    return imageUrls;
  }

  @action
  String formatTimestamp(Timestamp timestamp) {
    DateTime dateTime = timestamp.toDate();
    return DateFormat('yyyy-MM-dd – kk:mm').format(dateTime);
  }

  bool isLiked(String postId) {
    return likesMap.containsKey(postId) && likesMap[postId]!;
  }
}
