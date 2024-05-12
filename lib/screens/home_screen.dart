import 'package:flutter/material.dart';
import 'package:messanger_screen/models/chats_model.dart';
import 'package:messanger_screen/widgets/search_tab.dart';

import '../models/story_model.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/chats.dart';
import '../widgets/story_chat.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        clipBehavior: Clip.none,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: Colors.blue.withOpacity(.8),
              child: const CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(
                    'https://img.freepik.com/premium-vector/lion-head-logo-generative-ai-golden-mane-zoo-high-detail-design-style-minimalism-avatar-work-success-career-character-job-wild-animals-concept-vector-illustration_748571-1000.jpg'),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                'Chats',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: CircleAvatar(
              backgroundColor: Colors.grey.withOpacity(.1),
              child: const Icon(
                Icons.camera_alt_rounded,
                size: 30,
                color: Colors.black,
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: CircleAvatar(
              backgroundColor: Colors.grey.withOpacity(0.1),
              child: const Icon(
                Icons.edit,
                size: 30,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          const BottomNavBar(),
          CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: SearchTab(),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 80,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) =>
                          StoryChat(storyModel: storyList[index]),
                      itemCount: storyList.length),
                ),
              ),
              SliverToBoxAdapter(
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) =>
                      Chats(chatsModel: chatsList[index]),
                  itemCount: chatsList.length,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
