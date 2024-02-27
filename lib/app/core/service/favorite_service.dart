import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FavoriteService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> addFavorite(String postId) async {
    var userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) return;

    final likeRef = firestore.collection('posts').doc(postId).collection('likes').doc(userId);

    DocumentSnapshot likeSnapshot = await likeRef.get();

    if (likeSnapshot.exists) {
      await likeRef.delete();
    } else {
      await likeRef.set({
        'userId': userId,
        'timestamp': FieldValue.serverTimestamp(),
      });
    }
  }

  Future<List<DocumentSnapshot>> getLikedPosts() async {
    var userId = FirebaseAuth.instance.currentUser?.uid;
    List<DocumentSnapshot> likedPosts = [];

    if (userId == null) return likedPosts;

    QuerySnapshot postsSnapshot = await FirebaseFirestore.instance.collection('posts').get();

    for (var post in postsSnapshot.docs) {
      var likeRef = post.reference.collection('likes').doc(userId);
      DocumentSnapshot likeSnapshot = await likeRef.get();
      if (likeSnapshot.exists) {
        likedPosts.add(post);
      }
    }

    return likedPosts;
  }

  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // // Bir post için beğeni ekler veya kaldırır
  // Future<void> toggleLike(String postId, String userId) async {
  //   final likeRef = _firestore.collection('posts').doc(postId).collection('likes').doc(userId);

  //   DocumentSnapshot likeSnapshot = await likeRef.get();

  //   if (likeSnapshot.exists) {
  //     // Eğer doküman varsa, beğeniyi kaldır
  //     await likeRef.delete();
  //   } else {
  //     // Eğer doküman yoksa, beğeniyi ekle
  //     await likeRef.set({
  //       'userId': userId,
  //       'timestamp': FieldValue.serverTimestamp(),
  //     });
  //   }
  // }

  // // Kullanıcının beğendiği postları listeler
  // Stream<List<String>> getUserLikes(String userId) {
  //   return _firestore.collectionGroup('likes')
  //       .where('userId', isEqualTo: userId)
  //       .snapshots()
  //       .map((snapshot) => snapshot.docs.map((doc) => doc.reference.parent.parent!.id).toList());
  // }
}
