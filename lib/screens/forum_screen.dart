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
  void dispose() {
    _postController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Community Forum'),
        backgroundColor: kPrimaryColor,
      ),
      body: Column(
        children: [
          // Forum Messages
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseService().getForumPosts(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.data!.docs.isEmpty) {
                  return const Center(child: Text('No messages yet.'));
                }

                return ListView(
                  reverse: true, // latest messages at the bottom
                  children: snapshot.data!.docs.map((doc) {
                    final data = doc.data() as Map<String, dynamic>;
                    final userName = data['userName'] ?? 'Unknown User';
                    final content = data['content'] ?? '';
                    final timestamp = data['timestamp'];

                    return ListTile(
                      leading: const Icon(Icons.account_circle,
                          size: 40, color: kAccentColor),
                      title: Text(
                        userName,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(content),
                      trailing: Text(
                        timestamp != null
                            ? (timestamp as Timestamp)
                                .toDate()
                                .toString()
                                .substring(0, 16)
                            : '',
                        style:
                            const TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    );
                  }).toList(),
                );
              },
            ),
          ),

          // Message Input Box
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _postController,
                    decoration: const InputDecoration(
                      labelText: 'Share your thoughts',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.send, color: kAccentColor),
                  onPressed: () async {
                    if (_postController.text.trim().isNotEmpty) {
                      await FirebaseService()
                          .addForumPost(_postController.text.trim());
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
