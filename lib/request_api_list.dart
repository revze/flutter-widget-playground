import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:http/http.dart' as http;

class RequestApiListScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _RequestApiListState();
  }
}

class _RequestApiListState extends State {
  final originalItems = List<String>.generate(100, (i) => 'Text $i');
  Future<List> list;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    list = loadList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Request API List'),
      ),
      body: FutureBuilder<List>(
        future: list,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return StaggeredGridView.countBuilder(
                  crossAxisCount: 2,
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    String text = snapshot.data[index ];
                    int imageHeight = index.isEven ? 100 : 200;

                    return Container(
                      color: Colors.white,
                      child: Column(
                        children: <Widget>[
                          Image.network(
                            'https://picsum.photos/id/26/700/500',
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: imageHeight.toDouble(),
                          ),
                          Container(
                              padding: EdgeInsets.all(15),
                              child: Text(
                                text,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ))
                        ],
                      ),
                    );
                  },
                  staggeredTileBuilder: (int index) => StaggeredTile.fit(1));
            } else {
              var message = snapshot.error is SocketException
                  ? 'Internet bermasalah'
                  : 'Terjadi kesalahan';

              return Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(child: Text(message), margin: EdgeInsets.only(bottom: 10),),
                  RaisedButton(
                    onPressed: () {
                      setState(() {
                        list = loadList();
                      });
                    },
                    child: Text('Coba lagi'),
                  )
                ],
              ));
            }
          } else {
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: CircularProgressIndicator(),
                  margin: EdgeInsets.only(bottom: 20),
                ),
                Text('Please wait...')
              ],
            ));
          }
        },
      ),
    );
  }

  Future<List> loadList() async {
    var url = "https://dog.ceo/api/breeds/list/all";
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var responseBody = response.body;
      Map<String, dynamic> body = json.decode(responseBody);
      List dogs = body['message']['terrier'];

      print('dogs $dogs');

      return dogs;
    } else {
      throw Exception('Failed to load list');
    }
  }
}
