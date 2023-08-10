import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_map_practice/roll_base_login_view/admin_page.dart';
import 'package:google_map_practice/roll_base_login_view/user_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    isLogin();
  }

  isLogin()async{
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    bool login = sharedPref.getBool('Login')?? false;
    String? userType = sharedPref.getString('userType');

    if(login){
      if(userType == 'Admin'){
        Timer(const Duration (seconds: 3), () {
          Navigator.push(context, MaterialPageRoute(builder: (_)=>const Admin()));
        });
      }

    }else{
      Timer(const Duration (seconds: 3), () {
        Navigator.push(context, MaterialPageRoute(builder: (_)=>const User()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 250),
            child: Center(
              child: Text('This is SplashScreen',style: TextStyle(
                color: Colors.green,fontSize: 30
              ),),
            ),
          ),
        ],
      ),
    );
  }
}
