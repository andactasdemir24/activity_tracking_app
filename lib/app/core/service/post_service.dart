import 'dart:io';

import 'package:andac_case/app/core/models/post_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'storage_service.dart';

class PostService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  StorageService storageService = StorageService();
  String mediaUrl = '';

  Future<PostModel?> posts(String name, String location, XFile imageUrl, Timestamp time, int money) async {
    final ref = firestore.collection("posts");

    mediaUrl = await storageService.uploadPostsImage(File(imageUrl.path));

    DocumentReference documentRef = await ref.add({
      "name": name,
      "location": location,
      "imageUrl": mediaUrl,
      "time": time,
      "money": money,
    });

    return PostModel(id: documentRef.id, name: name, location: location, imageUrl: mediaUrl, time: time, money: money);
  }

  Stream<List<PostModel>> getStatusStream() {
    return firestore.collection("posts").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => PostModel.fromSnapshot(doc)).toList();
    });
  }

  Future<void> deletePosts(String id) async {
    var delete = await firestore.collection('posts').doc(id).delete();
    return delete;
  }
}
