import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:location/location.dart';
import 'package:syncfusion_flutter_maps/maps.dart';


class Ambulance extends StatefulWidget {
  const Ambulance({super.key});

  @override
  State<Ambulance> createState() => _AmbulanceState();
}

class _AmbulanceState extends State<Ambulance> {
  Future<LocationData?> _currentLocation() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;
 
    Location location = new Location();
 
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return null;
      }
    }
 
    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }
    return await location.getLocation();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
        SizedBox(height: 18),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text('Book An Ambulance', style: GoogleFonts.inter(
            textStyle: TextStyle(
              color: Color(0xffFF746E),
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          ),),
        ),
        SizedBox(height: 18),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Color(0xffFF746E))),
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width,
            child: FutureBuilder<LocationData?>(
      future: _currentLocation(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapchat) {
        if (snapchat.hasData) {
          final LocationData currentLocation = snapchat.data;
          return SfMaps(
            layers: [
              MapTileLayer(
                initialFocalLatLng: MapLatLng(
                    currentLocation.latitude!, currentLocation.longitude!),
                initialZoomLevel: 5,
                initialMarkersCount: 1,
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                markerBuilder: (BuildContext context, int index) {
                  return MapMarker(
                    latitude: currentLocation.latitude!,
                    longitude: currentLocation.longitude!,
                    child: Icon(
                      Icons.location_on,
                      color: Colors.red[800],
                    ),
                    size: Size(20, 20),
                  );
                },
              ),
            ],
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    ),
          ),
        ),
        SizedBox(height: 20),
        Center(
          child: ElevatedButton(
            onPressed: () {},
            child: Text('Book Ambulance', style: GoogleFonts.inter(
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),),
            style: ElevatedButton.styleFrom(
              primary: Color(0xffFF746E),
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ])
    );
  }
}