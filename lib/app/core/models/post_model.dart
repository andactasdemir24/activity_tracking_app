// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  String id;
  String name;
  String location;
  String imageUrl;
  Timestamp time;
  int money;

  PostModel(
      {required this.id,
      required this.name,
      required this.location,
      required this.imageUrl,
      required this.time,
      required this.money});

  factory PostModel.fromSnapshot(DocumentSnapshot snapshot) {
    return PostModel(
      id: snapshot.id,
      name: snapshot['name'],
      location: snapshot['location'],
      imageUrl: snapshot['imageUrl'],
      time: snapshot['time'],
      money: snapshot['money'],
    );
  }
}
