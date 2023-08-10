import 'package:flutter/material.dart';
import 'package:google_map_practice/tab_bar/page1_chat.dart';
import 'package:google_map_practice/tab_bar/page2_setting.dart';
import 'package:google_map_practice/tab_bar/page3_status.dart';
import 'package:google_map_practice/tab_bar/page4_calls.dart';
class BasicTabBar extends StatelessWidget {
  const BasicTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("TabBar"),
          centerTitle: true,
          bottom: const TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(text: 'Setting',),
              Tab(text: 'Calls',),
              Tab(text: 'Chat',),
              Tab(text: 'Status',)
            ],
          ),
        ),
        body:   const TabBarView(
          children: [
            Settings(),
            Calls(),
            ChatPage(),
            Status()
          ],
        ),
      ),
    );
  }
}
