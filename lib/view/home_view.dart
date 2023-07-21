import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Completer<GoogleMapController> _controller = Completer();
  static const CameraPosition _cameraPosition = CameraPosition(
      target: LatLng(31.474744,74.3801192,),
    zoom: 14.4746,
  );
  List<Marker> _markers = [];
  final List<Marker> _list = [
    Marker(
        markerId: MarkerId("1"),
      position: LatLng(31.474744,74.3801192,),
      infoWindow: InfoWindow(
        title: "my current Location"
      )
    ),
    Marker(markerId: MarkerId("2"),
        position: LatLng(31.4839221,74.3946335,),
        infoWindow: InfoWindow(
            title: "Devruptors"
        )
    ),
  ];
  @override
  void initState() {

    super.initState();
    _markers.addAll(_list);
  }
 Future<Position> getUserCurrentLocation()async  {
    await Geolocator.requestPermission().then((value){

    }).onError((error, stackTrace){
      print(error.toString());
    });
    return await Geolocator.getCurrentPosition();
}
  String stAdd = "",newStAdd = '';
  getLocation(){
    getUserCurrentLocation().then((value) async {
      if (kDebugMode) {
        print("my current location");
      }
      if (kDebugMode) {
        print("${value.latitude}${value.longitude}");
      }
      _markers.add(
        Marker(
            markerId: const MarkerId('3'),
            position: LatLng(value.latitude, value.longitude),
            infoWindow: const InfoWindow(
                title: 'user current location'
            )
        ),
      );
      CameraPosition cameraPosition = CameraPosition(
        target: LatLng(value.latitude, value.longitude),
        zoom: 14,
      );
      final GoogleMapController controller = await _controller.future;
      controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
     // stAdd = "${value.latitude} ${value.longitude}";
      List<Placemark> placemarks = await placemarkFromCoordinates(value.latitude, value.longitude);
        stAdd = "${placemarks.reversed.last.isoCountryCode}\n"
            "${placemarks.reversed.last.administrativeArea}"
            "\n${placemarks.reversed.last.country}\n${placemarks.reversed.last.subLocality}"
            "\n${placemarks.reversed.last.locality}\n${placemarks.reversed.last.postalCode}";

      // setState(() {
      //   stAdd = newStAdd;
      // });
 setState(() {

 });

    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: GoogleMap(
          initialCameraPosition: _cameraPosition,
          mapType: MapType.normal,
          compassEnabled: true,
          myLocationEnabled: true,
          // this use for + and - button off
          zoomControlsEnabled: false,
          markers:Set<Marker>.of(_markers) ,
          onMapCreated: (GoogleMapController controller){
            _controller.complete(controller);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.location_disabled_outlined),
        onPressed: ()async{
          // // this function is use for animate the Camera in the given LatLng
          // GoogleMapController controller = await _controller.future;
          // controller.animateCamera(CameraUpdate.newCameraPosition(
          //   const CameraPosition(
          //       target: LatLng(31.4839221,74.3946335)),
          // ));
          // setState(() {
          //
          // });
          _settingModalBottomSheet(context);
        },
      ),
    );
  }
  void _settingModalBottomSheet(context){
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc){
          return Wrap(
            children:[
              ListTile(
                  leading: const Icon(Icons.location_on_outlined),
                  title:const Text('Get Current Location'),
                onTap: () => {
                  getLocation()
                },
              ),
               ListTile(
                leading: const Icon(Icons.home),
                title:  Text(stAdd),
                   onTap: () => {
                 // Navigator.pop(context)
                   }
              ),
            ],
          );
        }
    );
  }

}
