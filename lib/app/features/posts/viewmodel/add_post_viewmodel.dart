// ignore_for_file: library_private_types_in_public_api

import 'package:andac_case/app/core/service/post_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
part 'add_post_viewmodel.g.dart';

class AddPostsViewModel = _AddPostsViewModelBase with _$AddPostsViewModel;

abstract class _AddPostsViewModelBase with Store {
  PostService postService = PostService();

  @observable
  String? postId;

  @observable
  ImagePicker picker = ImagePicker();

  @observable
  XFile? imageFile;

  @observable
  Timestamp? time;

  @observable
  TextEditingController nameController = TextEditingController();

  @observable
  TextEditingController locationController = TextEditingController();

  @observable
  TextEditingController moneyController = TextEditingController();

  @observable
  String? imageUrl;

  @observable
  bool isImageSelected = false;

  @action
  Future<void> pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    imageFile = pickedFile;
  }

  @action
  Future<void> selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      final DateTime now = DateTime.now();
      final DateTime selectedDateTime = DateTime(now.year, now.month, now.day, pickedTime.hour, pickedTime.minute);

      time = Timestamp.fromDate(selectedDateTime);
    }
  }

  @action
  void reset() {
    imageFile = null;
    imageUrl = null;
    nameController.clear();
    locationController.clear();
    time = null;
    moneyController.clear();
  }

  @action
  Future<void> addPost(BuildContext context) async {
    await postService.posts(
      nameController.text,
      locationController.text,
      imageFile!,
      time!,
      int.parse(moneyController.text),
    );
  }
}
