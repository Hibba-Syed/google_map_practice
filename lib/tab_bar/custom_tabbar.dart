import 'package:flutter/material.dart';
import 'package:google_map_practice/tab_bar/page1_chat.dart';
import 'package:google_map_practice/tab_bar/page2_setting.dart';
import 'package:google_map_practice/tab_bar/page3_status.dart';
import 'package:google_map_practice/tab_bar/page4_calls.dart';
class CustomTabBar extends StatelessWidget {
  const CustomTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("TabBar"),
          centerTitle: true,
          ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(25.0)
                ),
                child:  TabBar(
                //  indicatorColor mean line color
                 // indicatorColor: Colors.white,
                  indicator: BoxDecoration(
                    color: Colors.green.shade300,
                    borderRadius: BorderRadius.circular(25.0)
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,

                  tabs: const [
                    Tab(text: 'Setting',),
                    Tab(text: 'Calls',),
                    Tab(text: 'Chat',),
                    Tab(text: 'Status',)
                  ],
                ),
              ),
              const Expanded(
                  child:  TabBarView(
                    children: [
                      Settings(),
                      Calls(),
                      ChatPage(),
                      Status()
                    ],
                  ),
              ),
            ],
          ),
        )
      ),
    );
  }
}