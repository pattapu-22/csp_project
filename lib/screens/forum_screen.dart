import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:empower_safe/services/firebase_service.dart';
import 'package:empower_safe/constants.dart';

class ForumScreen extends StatefulWidget {
  const ForumScreen({super.key});

  @override
  _ForumScreenState createState() => _ForumScreenState();
}

class _ForumScreenState extends State<ForumScreen> {
  final _postController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Community Forum'),
        backgroundColor: kPrimaryColor,
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseService().getForumPosts(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
                return ListView(
                  children: snapshot.data!.docs.map((doc) {
                    return ListTile(
                      title: Text(doc['content']),
                      subtitle: Text(doc['timestamp'].toDate().toString()),
                    );
                  }).toList(),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _postController,
                    decoration: const InputDecoration(labelText: 'Share your thoughts'),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send, color: kAccentColor),
                  onPressed: () async {
                    if (_postController.text.isNotEmpty) {
                      await FirebaseService().addForumPost(_postController.text);
                      _postController.clear();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}