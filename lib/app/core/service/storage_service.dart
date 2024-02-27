import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class StorageService {
  final FirebaseStorage storage = FirebaseStorage.instance;

  Future<ListResult> getImageUrls() async {
    return await storage.ref('slider').listAll();
  }

  Future<String> uploadPostsImage(File file) async {
    String fileName = '${DateTime.now().millisecondsSinceEpoch}.${file.path.split('.').last}';

    var uploadTaskSnapshot = await storage.ref('posts/$fileName').putFile(file);

    String downloadURL = await uploadTaskSnapshot.ref.getDownloadURL();

    return downloadURL;
  }
}
