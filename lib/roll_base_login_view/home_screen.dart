import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String email = '', type = '';

   @override
  void initState() {
    super.initState();
    loadData();
  }
  // this function is use for loading data from SharedPreferences
   loadData()async{
     SharedPreferences sharedPref = await SharedPreferences.getInstance();
     email = sharedPref.getString('email')?? '';
     type = sharedPref.getString('userType')?? '';
     setState(() {

     });
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        centerTitle: true,
      ),
      body:  Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 150),
            child: Center(
              child: Text('Home Screen'),
            ),
          ),
         const SizedBox(height: 20,),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
            const Text('Email'),
            Text(email),
          ],),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text('Type'),
              Text(type),
            ],),
          const SizedBox(height: 20,),
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
