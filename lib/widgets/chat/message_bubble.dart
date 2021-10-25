import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble(
    this.message,
    this.userName,
    this.userImage,
    this.isMe, {
    Key key,
  }) : super(key: key);
  final String message;
  final String userName;
  final String userImage;
  final bool isMe;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisAlignment:
              isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: isMe ? Colors.blueAccent : Colors.pinkAccent,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(12),
                  topRight: const Radius.circular(12),
                  bottomLeft: !isMe
                      ? const Radius.circular(0)
                      : const Radius.circular(12),
                  bottomRight: isMe
                      ? const Radius.circular(0)
                      : const Radius.circular(12),
                ),
              ),
              width: 140,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
              child: Column(
                crossAxisAlignment:
                    isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: <Widget>[
                  Text(userName,
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold,
                        color: isMe ? Colors.white : Colors.white,
                      )),
                      const SizedBox(height: 10,),
                  Text(
                    message,
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Nunito',
                      color: isMe ? Colors.white : Colors.white,
                    ),
                    textAlign: isMe ? TextAlign.end : TextAlign.start,
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
            top: 0,
            left: isMe ? null : 120,
            right: isMe ? 120 : null,
            child: CircleAvatar(
              backgroundImage: NetworkImage(userImage),
            )),
      ],
      clipBehavior: Clip.none,
    );
  }
}
