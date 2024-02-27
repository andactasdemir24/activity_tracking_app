import 'package:cloud_firestore/cloud_firestore.dart';

class FavoriteModel {
  String postId;
  String userId;

  FavoriteModel({required this.postId, required this.userId});

  factory FavoriteModel.fromSnapshot(DocumentSnapshot snapshot) {
    return FavoriteModel(
      postId: snapshot['postId'],
      userId: snapshot['userId'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'postId': postId,
      'userId': userId,
    };
  }
}
