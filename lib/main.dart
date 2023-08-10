import 'package:flutter/material.dart';
import 'package:google_map_practice/tab_bar/custom_tabbar.dart';
import 'package:google_map_practice/tab_bar/tab_bar.dart';
import 'date_time/date_time.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //  useMaterial3: true,
      ),
      home: const CustomTabBar(),
      debugShowCheckedModeBanner: false,
    );
  }
}


