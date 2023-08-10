
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
class ConvertLatLangToAddress extends StatefulWidget {
  const ConvertLatLangToAddress({Key? key}) : super(key: key);

  @override
  State<ConvertLatLangToAddress> createState() => _ConvertLatLangToAddressState();
}

class _ConvertLatLangToAddressState extends State<ConvertLatLangToAddress> {

  String stAddress = "",stAdd = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
           const SizedBox(height: 150,),
             Text(stAddress),
            Text(stAdd),
            ElevatedButton(
                onPressed: ()async{
                 // this line of code use for convert address in to latitude, longitude
                  List<Location> locations = await locationFromAddress("devruptors inc lahore");
                  // this line of code use for convert latitude, longitude in to address
                  List<Placemark> placemarks = await placemarkFromCoordinates(31.4839, 74.3953);
                setState(() {
                  stAddress = "${locations.last.latitude} ${locations.last.longitude}";
                  stAdd = "${placemarks.reversed.last.isoCountryCode}\n"
                      "${placemarks.reversed.last.administrativeArea}"
                      "\n${placemarks.reversed.last.country}\n${placemarks.reversed.last.subLocality}"
                      "\n${placemarks.reversed.last.locality}\n${placemarks.reversed.last.postalCode}";
                });
                },
                child: const Text("Convert"),
            ),
          ],
        ),
      ),
    );
  }
}
