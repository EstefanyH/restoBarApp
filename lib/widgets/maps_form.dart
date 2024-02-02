import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsForm extends StatefulWidget {
  const MapsForm({super.key});

  @override
  State<MapsForm> createState() => _MapsFormState();
}

class _MapsFormState extends State<MapsForm> {

  static const LatLng _pGooglePlex = LatLng(37.4223, -122.0848);
  static const LatLng _pApplePark = LatLng(37.3346, -122.0090);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
          target: _pGooglePlex,
          zoom: 13,), 
        markers: {
           const Marker(markerId: MarkerId("_currentLocation"), 
                icon: BitmapDescriptor.defaultMarker, 
                position: _pGooglePlex),
           const Marker(markerId: MarkerId("_sourceLocation"), 
                icon: BitmapDescriptor.defaultMarker, 
                position: _pApplePark),
        },
        ),
      );
  }
}