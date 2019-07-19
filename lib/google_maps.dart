import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _GoogleMapsState();
  }
}

class _GoogleMapsState extends State {
  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> markers = Set();

  static final CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(37.42796133580664, -122.085749655962), zoom: 14.4746);
  static final CameraPosition _kLake = CameraPosition(
      target: LatLng(37.43296265331129, -122.08832357078792),
      bearing: 192.8334901395799,
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    markers.add(Marker(
        markerId: MarkerId('1'),
        position: LatLng(37.42796133580664, -122.085749655962)));
    markers.add(Marker(
        markerId: MarkerId('2'),
        position: LatLng(37.43296265331129, -122.08832357078792)));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Maps'),
      ),
      body: GoogleMap(
        initialCameraPosition: _kGooglePlex,
        mapType: MapType.normal,
        markers: markers,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _goToTheWarunkUpnormal();
        },
        label: Text('Go to warunk upnormal'),
        icon: Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }

  Future<void> _goToTheWarunkUpnormal() async {
    LatLng warunkUpnormalPosition = LatLng(-6.2259698, 106.8553424);
    _addMarker(warunkUpnormalPosition);

    final GoogleMapController controller = await _controller.future;
    CameraPosition cameraWarunkUpnormal =
        CameraPosition(target: warunkUpnormalPosition, zoom: 15);
    controller
        .animateCamera(CameraUpdate.newCameraPosition(cameraWarunkUpnormal));
  }

  void _addMarker(LatLng position) {
    Future<BitmapDescriptor> icon2 = _createMarkerImageFromAsset('assets/marker.png');

    Marker marker = Marker(
      markerId: MarkerId('3'),
      position: position,
//      icon: BitmapDescriptor.fromBytes('assets/marker.png'),
//      icon: icon2,
      infoWindow:
      InfoWindow(title: 'Warunk gak normal', snippet: 'Ini deskripsinya'),
    );
    setState(() {
      markers.add(marker);
    });
  }

  Future<BitmapDescriptor> _createMarkerImageFromAsset(String iconPath) async {
    ImageConfiguration configuration = ImageConfiguration();
    BitmapDescriptor bmdp = await BitmapDescriptor.fromAssetImage(configuration, iconPath);
    return bmdp;
  }
}
