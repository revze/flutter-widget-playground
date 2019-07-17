import 'dart:async';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PermissionState();
  }
}

class _PermissionState extends State {
  bool isCameraDontAskAgain = false;
  bool isStorageDontAskAgain = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('Sample Permission')),
      body: Container(
        padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: requestCameraPermission,
              child: Text('Check Camera Permission'),
            ),
            RaisedButton(
              onPressed: requestStoragePermission,
              child: Text('Check Storage Permission'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> requestCameraPermission() async {
    Map<PermissionGroup, PermissionStatus> permissions = await PermissionHandler().requestPermissions([PermissionGroup.camera]);
    PermissionStatus permissionStatus = await PermissionHandler().checkPermissionStatus(PermissionGroup.camera);
    print("permission ${permissionStatus.value.toString()}");

    if (permissionStatus.value == 2) {
      print("Permission granted");
    }
    else if (permissionStatus.value == 0) {
      bool isShown = await PermissionHandler().shouldShowRequestPermissionRationale(PermissionGroup.camera);
      print("should show request permission rationale $isShown");

      if (!isShown) {
        setState(() {
          isCameraDontAskAgain = true;
        });
      }
      _showCameraPermissionRationaleDialog();
    }
  }

  Future<void> requestStoragePermission() async {
    Map<PermissionGroup, PermissionStatus> permissions = await PermissionHandler().requestPermissions([PermissionGroup.storage]);
    PermissionStatus permissionStatus = await PermissionHandler().checkPermissionStatus(PermissionGroup.storage);
    print('permission ${permissionStatus.value.toString()}');

    if (permissionStatus.value == 2) {
      print('Permission granted');
    } else if (permissionStatus.value == 0) {
      bool isShown = await PermissionHandler().shouldShowRequestPermissionRationale(PermissionGroup.storage);
      print('should show request permission rationale $isShown');

      if (!isShown) {
        setState(() {
          isStorageDontAskAgain = true;
        });
      }

      _showStoragePermissionRationaleDialog();
    }
  }

  void _showCameraPermissionRationaleDialog() {
    showDialog(context: context, builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Please grant camera permission'),
        content: Text('Grumpy wizards make toxic brew for the evil Queen and Jack'),
        actions: <Widget>[
          FlatButton(onPressed: () {
            Navigator.of(context).pop();
          }, child: Text('Close')),
          FlatButton(onPressed: () {
            Navigator.of(context).pop();
            if (isCameraDontAskAgain) {
              openAppSettings();
            } else {
              requestCameraPermission();
            }
          }, child: Text('Grant'))
        ],
      );
    });
  }

  void _showStoragePermissionRationaleDialog() {
    showDialog(context: context, builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Please grant storage permission'),
        content: Text('Grumpy wizards make toxic brew for the evil Queen and Jack'),
        actions: <Widget>[
          FlatButton(onPressed: () {
            Navigator.of(context).pop();
          }, child: Text('Close')),
          FlatButton(onPressed: () {
            Navigator.of(context).pop();
            if (isStorageDontAskAgain) {
              openAppSettings();
            } else {
              requestStoragePermission();
            }
          }, child: Text('Grant'))
        ],
      );
    });
  }

  void openAppSettings() async {
    await PermissionHandler().openAppSettings();
  }
}
