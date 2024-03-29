import 'dart:async';

import 'package:camera/camera.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import './camera.dart';
import './carousel_slider.dart';
import './custom_color.dart';
import './custom_font.dart';
import './file_manager.dart';
import './image_asset.dart';
import './infinity_scroll_listview.dart';
import './infintiy_scroll_gridview.dart';
import './location_checker.dart';
import './pageview.dart';
import './permission.dart';
import './request_api_list.dart';
import './staggered_gridview.dart';
import './web_view.dart';
import './google_maps.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Widget Playground',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Widget Playground'),
      routes: <String, WidgetBuilder>{
        '/pageview': (BuildContext context) => PageViewApp(),
        '/custom_color': (BuildContext context) => CustomColorApp(),
        '/file_manager': (BuildContext context) => FileManagerScreen(),
        '/image_asset': (BuildContext context) => ImageAssetApp(),
        '/custom_font': (BuildContext context) => CustomFontApp(),
        '/carousel_slider': (BuildContext context) => CarouselSliderApp(),
        '/infinity_scroll_listview': (BuildContext context) =>
            InfinityScrollListViewScreen(),
        '/infinity_scroll_gridview': (BuildContext context) =>
            InfinityScrollGridViewScreen(),
        '/permission': (BuildContext context) => PermissionScreen(),
        '/web_view': (BuildContext context) => WebViewScreen(),
        '/staggered_gridview': (BuildContext context) =>
            StaggeredGridViewScreen(),
        '/request_api_list': (BuildContext context) => RequestApiListScreen(),
        '/location_checker': (BuildContext context) => LocationCheckerScreen(),
        '/google_maps': (BuildContext context) => GoogleMapsScreen()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
          child: Center(
              child: Column(
        // Column is also layout widget. It takes a list of children and
        // arranges them vertically. By default, it sizes itself to fit its
        // children horizontally, and tries to be as tall as its parent.
        //
        // Invoke "debug painting" (press "p" in the console, choose the
        // "Toggle Debug Paint" action from the Flutter Inspector in Android
        // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
        // to see the wireframe for each widget.
        //
        // Column has various properties to control how it sizes itself and
        // how it positions its children. Here we use mainAxisAlignment to
        // center the children vertically; the main axis here is the vertical
        // axis because Columns are vertical (the cross axis would be
        // horizontal).
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              margin: EdgeInsets.only(top: 20),
              child: RaisedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/pageview');
                },
                child: Text('PageView'),
              )),
          RaisedButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/custom_color');
            },
            child: Text('Custom Color'),
          ),
          RaisedButton(
            onPressed: openCamera,
            child: Text('Camera'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/file_manager');
            },
            child: Text('File Manager'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/image_asset');
            },
            child: Text('Image Asset'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/custom_font');
            },
            child: Text('Custom Font'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/carousel_slider');
            },
            child: Text('Carousel Slider'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/infinity_scroll_listview');
            },
            child: Text('Infinity ListView Scroll'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/infinity_scroll_gridview');
            },
            child: Text('Infinity GridView Scroll'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/permission');
            },
            child: Text('Permission'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/web_view');
            },
            child: Text('WebView'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/staggered_gridview');
            },
            child: Text('Staggered GridView'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/request_api_list');
            },
            child: Text('Request API List'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/location_checker');
            },
            child: Text('Location Checker'),
          ),
          Container(
              margin: EdgeInsets.only(bottom: 20),
              child: RaisedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/google_maps');
                },
                child: Text('Google Maps'),
              ))
        ],
      ))),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Future<void> openCamera() async {
    final cameras = await availableCameras();
    final camera = cameras.first;

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => CameraApp(camera)));
  }

  Future<void> openFileManager() async {
    String filePath = await FilePicker.getFilePath(type: FileType.IMAGE);
    print("filePath $filePath");
  }
}
