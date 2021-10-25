import 'package:chat_application/widgets/chat/messages.dart';
import 'package:chat_application/widgets/chat/new_message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              icon: const Icon(
                Icons.exit_to_app_outlined,
                color: Colors.black,
              ))
        ],
      ),
      body: Column(
        children: const <Widget>[
          Expanded(child: Messages()),
          NewMessage(),
        ],
      ),
    );
  }
}
