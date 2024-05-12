import 'package:flutter/material.dart';

import '../models/story_model.dart';

class StoryChat extends StatelessWidget {
  final StoryModel storyModel;

  const StoryChat({
    super.key,
    required this.storyModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          CircleAvatar(
            radius:30 ,
            backgroundColor: Colors.blue,
            child: CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(storyModel.imagePath),
            ),
          ),
          const CircleAvatar(
            radius:11 ,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 8,
              backgroundColor: Colors.green,
            ),
          )
        ],
      ),
    );
  }
}
