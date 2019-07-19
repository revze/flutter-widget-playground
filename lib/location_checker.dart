import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationCheckerScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LocationCheckerState();
  }
}

class _LocationCheckerState extends State {
  Future<LocationData> _locationDataController;
  bool isLocationDontAskAgain = false;
  Location location = new Location();
  bool isLocationEnabled = false;
  bool requestedLocationService = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Location Checker'),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(bottom: 10),
                child: RaisedButton(
                  onPressed: () {
                    checkLocationService();
                  },
                  child: Text('Get Location'),
                )),
            FutureBuilder<LocationData>(
                future: _locationDataController,
                builder: (context, snapshot) {
                  print('snapshot ${snapshot.connectionState}');
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      return Text(
                          'Location: ${snapshot.data.latitude} ${snapshot.data.longitude}');
                    } else {
                      return Text('Failed to get address');
                    }
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return Center(
                      child: Container(
                        child: CircularProgressIndicator(),
                        width: 60,
                        height: 60,
                      ),
                    );
                  } else if (snapshot.connectionState == ConnectionState.none) {
                    return Container();
                  }
                })
          ],
        ),
      ),
    );
  }

  Future<LocationData> getCurrentLocation() async {
    LocationData currentLocation;
    location = new Location();

    try {
      currentLocation = await location.getLocation();
      print(
          'location ${currentLocation.latitude} ${currentLocation.longitude}');

      return currentLocation;
    } catch (e) {
      print('error');
      throw Exception('Gagal mendapatkan lokasi');
    }
  }

  Future<void> requestLocationPermission() async {
    Map<PermissionGroup, PermissionStatus> permissions =
        await PermissionHandler()
            .requestPermissions([PermissionGroup.location]);
    PermissionStatus permissionStatus = await PermissionHandler()
        .checkPermissionStatus(PermissionGroup.location);
    print('permission ${permissionStatus.value.toString()}');

    if (permissionStatus.value == 2) {
      print('Permission granted');
      setState(() {
        _locationDataController = getCurrentLocation();
      });
    } else if (permissionStatus.value == 0) {
      bool isShown = await PermissionHandler()
          .shouldShowRequestPermissionRationale(PermissionGroup.location);
      print('should show request permission rationale $isShown');

      if (!isShown) {
        setState(() {
          isLocationDontAskAgain = true;
        });
      }

      _showLocationPermissionRationaleDialog();
    }
  }

  void openAppSettings() async {
    await PermissionHandler().openAppSettings();
  }

  void _showLocationPermissionRationaleDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Please grant location permission'),
            content: Text(
                'Grumpy wizards make toxic brew for the evil Queen and Jack'),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Close')),
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    if (isLocationDontAskAgain) {
                      openAppSettings();
                    } else {
                      requestLocationPermission();
                    }
                  },
                  child: Text('Grant'))
            ],
          );
        });
  }

  void checkLocationService() {
    Location location = Location();

    location.serviceEnabled().then((result) {
      print('result = $result');
      if (result == true) {
        requestLocationPermission();
      } else {
        if (requestedLocationService == false) {
          requestedLocationService = true;

          location.requestService().then((onValue) {
            requestedLocationService = false;
          });
        }
      }
    });
  }
}
