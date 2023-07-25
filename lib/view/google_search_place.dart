import 'dart:convert';
import 'dart:html';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart'as http;
class GoogleSearchPlacesApi extends StatefulWidget {
  const GoogleSearchPlacesApi({Key? key}) : super(key: key);

  @override
  State<GoogleSearchPlacesApi> createState() => _GoogleSearchPlacesApiState();
}

class _GoogleSearchPlacesApiState extends State<GoogleSearchPlacesApi> {

  List<dynamic> placeList = [];
  var controller = TextEditingController();
  var uuid = Uuid();
  String _sessionToken = '122344';
  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      onChange();
    });
  }
  onChange(){
    if(_sessionToken == null){
      setState(() {
        _sessionToken = uuid.v4();
      });
    }
    getSuggesion(controller.text);
  }
  void getSuggesion(String input)async{
    String PLACES_API_KEY = 'AIzaSyDvnEdnVR5GZzpCwkoO9FrF6rMAwadT3eU';
    String baseURL = 'https://maps.googleapis.com/maps/api/place/autocomplete/json';
    String url = '$baseURL?input=$input&key=$PLACES_API_KEY&sessiontoken=$_sessionToken';
    var resonse = await http.get(Uri.parse(url));
    var data =resonse.body.toString();
    print(data);
    if(resonse.statusCode == 200){
      setState(() {
        placeList = jsonDecode(resonse.body.toString()) ['predictions'];
      });
    }else{
      throw Exception('Failed to load data');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: "Seek your location here",
                focusColor: Colors.white,
                floatingLabelBehavior: FloatingLabelBehavior.never,
                prefixIcon: const Icon(Icons.map),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.cancel), onPressed: () {
                  controller.clear() ;
                },
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: placeList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () async {

                  },
                  child: ListTile(
                  title: Text(placeList[index]["description"]),
                  ),
                  );
                }
            ),
          ),
        ],
      ),
    );
  }
}
