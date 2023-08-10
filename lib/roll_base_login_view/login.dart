import 'package:flutter/material.dart';
import 'package:google_map_practice/roll_base_login_view/admin_page.dart';
import 'package:google_map_practice/roll_base_login_view/user_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var email = TextEditingController();
  var password = TextEditingController();
  List<String> items = ['Admin','User'];
  String selectedItem = 'Admin';
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade200,
        title: const Text('Login '),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child: Column(
            children: [
              const SizedBox(height: 40,),
              SizedBox(
                width: 210,
                child: DropdownButtonFormField(
                  decoration: const InputDecoration(
                   // isCollapsed: true,
                    isDense: true,
                    enabledBorder: InputBorder.none
                    // enabledBorder: OutlineInputBorder(
                    //   borderRadius: BorderRadius.circular(12),
                    //   borderSide: const BorderSide(color: Colors.green),
                    // ),
                  ),

                  value: selectedItem,
                    items: items.map((item) => DropdownMenuItem<String>(
                      value: item,
                        child: Text(item)
                    )
                    ).toList(),
                  onChanged: (item) {
                    selectedItem = item!;
                  },
                    ),
                ),
              const SizedBox(height: 40,),
              TextField(
                controller: email,
                decoration: InputDecoration(
                  isDense: true,
                  hintText: 'Email',
                  enabledBorder:OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                    borderSide:const BorderSide(
                      color: Colors.green
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40,),
              TextField(
                controller: password,
                decoration: InputDecoration(
                  isDense: true,
                  hintText: 'Password',
                  enabledBorder:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:const BorderSide(
                        color: Colors.green
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40,),
              ElevatedButton(
                  onPressed: ()async {
                    SharedPreferences sharedPref = await SharedPreferences.getInstance();
                    sharedPref.setString('email', email.text.toString());
                    sharedPref.setBool('Login', true);
                    sharedPref.setString('userType', selectedItem);
                   if(sharedPref.getString('userType')== 'Admin'){
                     Navigator.push(context, MaterialPageRoute(builder: (_)=> Admin()));
                   }else if(sharedPref.getString('userType') == 'User'){
                       Navigator.push(
                           context, MaterialPageRoute(builder: (_) => User()));

                   }else{
                    Navigator.push(
                    context, MaterialPageRoute(builder: (_) => Login()));
                    } {

                    }// sharedPref.remove('name');
                    // print(sharedPref.get('name'));
                  },
                  child: const Text('Login')
              ),
              // const SizedBox(height: 40,),
              // ElevatedButton(
              //     onPressed: ()async {
              //       SharedPreferences sharedPref = await SharedPreferences.getInstance();
              //      sharedPref.clear();
              //       Navigator.push(context, MaterialPageRoute(builder: (_)=> Admin()));
              //
              //       // sharedPref.remove('name');
              //       // print(sharedPref.get('name'));
              //     },
              //     child: const Text('Logout')
              // ),

            ],
          ),
        ),
      ),
    );
  }
}
