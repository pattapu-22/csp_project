import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/report.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signInAnonymously() async {
    await _auth.signInAnonymously();
  }

  // Sign Out
  Future<void> signOut() async {
    await _auth.signOut();
  }

  // Get current user
  User? getCurrentUser() {
    return _auth.currentUser;
  }

  Future<void> addReport(Report report) async {
    await _firestore.collection('reports').doc(report.id).set(report.toMap());
  }

  Stream<QuerySnapshot> getForumPosts() {
    return _firestore.collection('forum_posts').snapshots();
  }

  Future<void> addForumPost(String content) async {
    await _firestore.collection('forum_posts').add({
      'content': content,
      'timestamp': DateTime.now(),
      'userId': _auth.currentUser?.uid,
    });
  }
}
