import 'dart:async';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class FileManagerScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FileManagerScreenState();
  }
}

class _FileManagerScreenState extends State {
  String _currentFormat = "all";
  List<DropdownMenuItem<String>> _formatItems = List();
  Future<String> _fileManagerController;
  String _filePath = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _formatItems.add(DropdownMenuItem(
        value: 'all',
        child: Text('All', style: TextStyle(color: Colors.blue))));
    _formatItems.add(DropdownMenuItem(
        value: 'image',
        child: Text('Image', style: TextStyle(color: Colors.red))));
    _formatItems.add(DropdownMenuItem(
        value: 'video',
        child: Text('Video', style: TextStyle(color: Colors.orange))));
    _formatItems.add(DropdownMenuItem(
        value: 'audio',
        child: Text('Audio', style: TextStyle(color: Colors.orange))));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('File Manager'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Format'),
            Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: SizedBox(
                  width: double.infinity,
                  child: DropdownButton(
                      value: _currentFormat,
                      items: _formatItems,
                      onChanged: changeDropdownItem),
                )),
            SizedBox(
              width: double.infinity,
              child: RaisedButton(
                onPressed: () {
                  _fileManagerController = getFile();
                },
                child: Text('Get File'),
              ),
            ),
            FutureBuilder<void>(
                future: _fileManagerController,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (_filePath != null) {
                      return Text('File name: $_filePath');
                    } else {
                      return Container();
                    }
                  } else {
                    return Container();
                  }
                })
          ],
        ),
      ),
    );
  }

  void changeDropdownItem(String item) {
    setState(() {
      _currentFormat = item;
    });
  }

  Future<String> getFile() async {
    String filePath;
    switch (_currentFormat) {
      case 'all':
        filePath = await FilePicker.getFilePath(type: FileType.ANY);
        break;
      case 'image':
        filePath = await FilePicker.getFilePath(type: FileType.IMAGE);
        break;
      case 'video':
        filePath = await FilePicker.getFilePath(type: FileType.VIDEO);
        break;
      case 'audio':
        filePath = await FilePicker.getFilePath(type: FileType.AUDIO);
        break;
      default:
        filePath = await FilePicker.getFilePath(type: FileType.ANY);
        break;
    }

    print("filePath $filePath");

    setState(() {
      if (filePath != null) {
        _filePath = filePath;
      }
    });

    return filePath;
  }
}
