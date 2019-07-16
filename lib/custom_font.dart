import 'package:flutter/material.dart';

class CustomFontApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Custom Font',
      theme: ThemeData(fontFamily: 'Revan UI'),
      home: CustomFontScreen(),
    );
  }
}

class CustomFontScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CustomFontState();
  }
}

class _CustomFontState extends State {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('Custom Font'),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Container(
                  child: Text(
                      'Grumpy wizards make toxic brew for the evil Queen and Jack',),
                  margin: EdgeInsets.only(bottom: 20),
                ),
                Container(
                  child: Text(
                      'Grumpy wizards make toxic brew for the evil Queen and Jack',
                      style: TextStyle(fontWeight: FontWeight.w500)),
                  margin: EdgeInsets.only(bottom: 20),
                ),
                Container(
                  child: Text(
                      'Grumpy wizards make toxic brew for the evil Queen and Jack',
                  style: TextStyle(fontWeight: FontWeight.w700),),
                  margin: EdgeInsets.only(bottom: 20),
                ),
                Container(
                  child: Text(
                      'Grumpy wizards make toxic brew for the evil Queen and Jack',
                  style: TextStyle(fontWeight: FontWeight.w900),),
                  margin: EdgeInsets.only(bottom: 20),
                )
              ],
            ),
          ),
        ));
  }
}
