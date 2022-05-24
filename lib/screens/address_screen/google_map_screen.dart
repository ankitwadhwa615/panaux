import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '../../commons/constants.dart';
import 'address_screen.dart';

class GoogleMapScreen extends StatefulWidget {
  final double lat;
  final double long;
  const GoogleMapScreen({Key? key,required this.lat,required this.long}) : super(key: key);

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {


  late GoogleMapController _controller;
  Location location = Location();

  void _onMapCreated(GoogleMapController _cntlr) {
    _controller = _cntlr;
    location.onLocationChanged.listen((l) {
      _controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(l.latitude!, l.longitude!), zoom: 15),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    LatLng initialCameraPosition = LatLng(widget.lat, widget.long);
    Set<Marker> markers={
      Marker(
          markerId: const MarkerId('Home'),
          infoWindow: const InfoWindow(title: 'Home'),
          position: initialCameraPosition,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed)
      )
    };
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: Get.height-150,
                width: Get.width,
                child: GoogleMap(
                  initialCameraPosition:
                      CameraPosition(target: initialCameraPosition),
                  mapType: MapType.normal,
                  onMapCreated: _onMapCreated,
                  // myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                  markers: markers,

                ),
              ),
              const SizedBox(height: 15,),
              MaterialButton(
                onPressed: () {
                  Get.to(const AddressScreen());
                },
                height: 40,
                minWidth: 200,
                child: const Text(
                  'Next',
                  style: TextStyle(color: Colors.white),
                ),
                color: primaryColor,
              ),
              MaterialButton(
                onPressed: () {
                  Get.to(const AddressScreen());
                },
                height: 40,
                minWidth: 200,
                child: const Text(
                  'ADD ADDRESS',
                  style: TextStyle(color: Colors.white),
                ),
                color: primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
