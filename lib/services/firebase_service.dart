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

  Future<String?> getUsername() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        DocumentSnapshot doc = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();
        return doc.get('username') as String?;
      }
    } catch (e) {
      print('Error fetching username: $e');
    }
    return null;
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
