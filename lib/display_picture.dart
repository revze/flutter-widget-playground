import 'dart:io';

import 'package:flutter/material.dart';

class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  DisplayPictureScreen(this.imagePath);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print('imagePath $imagePath');

    return Scaffold(
      appBar: AppBar(
        title: Text('Display the Picture'),
      ),
      body: Image.file(File(imagePath)),
    );
  }
}
