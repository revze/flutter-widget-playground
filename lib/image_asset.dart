import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageAssetApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ImageAssetScreen(),
    );
  }
}

class ImageAssetScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ImageAssetState();
  }
}

class _ImageAssetState extends State {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SvgPicture.asset(
              'assets/home.svg',
              width: 50,
              height: 50,
            ),
            Image.asset(
              'assets/home.svg',
              width: 24,
              height: 24,
            ),
            Row(
              children: <Widget>[
                Container(
                    margin: EdgeInsets.only(right: 16),
                    child: Image.asset(
                      'assets/ghost.png',
                      width: 24,
                      height: 24,
                    )),
                Image.asset(
                  'assets/paper-plane.png',
                  width: 24,
                  height: 24,
                ),
              ],
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          Image.asset('assets/352-300x200.jpg'),
          Image.asset('assets/352-1000x800.jpg'),
          Image.asset(
            'assets/352-1000x800.jpg',
            width: 100,
            height: 100,
          ),
        ],
      )),
    );
  }
}
