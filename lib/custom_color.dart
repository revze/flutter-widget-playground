import 'package:flutter/material.dart';

import './helper/new_colors.dart';

class CustomColorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: CustomColorScreen(),
    );
  }
}

class CustomColorScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CustomColorScreenState();
  }
}

class _CustomColorScreenState extends State {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Custom Color',
//          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: NewColors.cabaret,
//        backgroundColor: Color(0xFF3B5998),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              color: NewColors.yellow,
              height: 60,
            ),
            Container(
              color: NewColors.red,
              height: 60,
            ),
            Container(
              color: NewColors.blue,
              height: 60,
            ),
            Container(
              color: NewColors.mediumTurqoise,
              height: 60,
            ),
          ],
        ),
      ),
    );
  }
}
