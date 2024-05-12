import 'package:flutter/material.dart';

import '../models/chats_model.dart';

class Chats extends StatelessWidget {
  const Chats({super.key, required this.chatsModel});

  final ChatsModel chatsModel;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Stack(
        alignment: Alignment.bottomRight,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.blue,
            child: CircleAvatar(
              radius: 23.5,
              backgroundImage: NetworkImage(chatsModel.imagePath),
            ),
          ),
          const CircleAvatar(
            radius: 10,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 8,
              backgroundColor: Colors.green,
            ),
          )
        ],
      ),
      title: Text(
        chatsModel.title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Row(
        children: [
          Text(
            chatsModel.subTitle,
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          ),
          const Spacer(),
          Text(
            chatsModel.time,
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          ),
          const Spacer(flex: 4),
        ],
      ),
      trailing: Icon(
        chatsModel.icon,
      ),
    );
  }
}
