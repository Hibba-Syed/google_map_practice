import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login.dart';
class Admin extends StatefulWidget {
  const Admin({Key? key}) : super(key: key);

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Admin View'),
       // automaticallyImplyLeading: false,
      ),
      body:  Column(
        children: [
         const Padding(
           padding: EdgeInsets.only(top: 50),
           child: Center(
               child: Text(" i am Admin ")
           ),
         ),
          ElevatedButton(
              onPressed: ()async {
                SharedPreferences sharedPref = await SharedPreferences.getInstance();
                sharedPref.clear();
                Navigator.push(context, MaterialPageRoute(builder: (_)=> Login()));

                // sharedPref.remove('name');
                // print(sharedPref.get('name'));
              },
              child: const Text('Logout')
          ),
        ],
      ),
    );
  }
}
