import 'package:flutter/material.dart';
import 'package:google_map_practice/roll_base_login_view/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'admin_page.dart';
class User extends StatefulWidget {
  const User({Key? key}) : super(key: key);

  @override
  State<User> createState() => _UserState();
}

class _UserState extends State<User> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('User View'),
      ),
      body:  const Column(
        children: [
        Padding(
          padding: EdgeInsets.only(top: 50),
          child: Center(
              child: Text('I am User'),
          ),
        ),
          SizedBox(height: 40,),

      ],),
    );
  }
}
