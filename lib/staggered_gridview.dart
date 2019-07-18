import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import './helper/new_colors.dart';

class StaggeredGridViewScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _StaggeredGridViewState();
  }
}

class _StaggeredGridViewState extends State {
  int perPage = 10;
  int present = 0;
  final originalItems = List<String>.generate(100, (i) => 'Text $i');
  var items = List<String>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      items.addAll(originalItems.getRange(present, present + perPage));
      present = present + perPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('Staggered GridView'),
        ),
        body: Container(
          color: NewColors.gainsboro,
          child: NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification scrollInfo) {
                if (scrollInfo.metrics.pixels ==
                    scrollInfo.metrics.maxScrollExtent) {
                  Future.delayed(Duration(milliseconds: 1000), loadMore);
                }
              },
              child: StaggeredGridView.countBuilder(
                crossAxisCount: 2,
                itemCount: (present <= originalItems.length)
                    ? items.length + 1
                    : items.length,
                itemBuilder: (BuildContext context, int index) {
                  String text = index.isEven
                      ? 'Lorem Ipsum Dolor'
                      : 'Toxic Toxic Toxic Toxic Toxic Toxic Toxic Toxic Toxic Toxic Toxic Toxic';
                  int imageHeight = index.isEven ? 100 : 200;

                  if (index == items.length) {
                    return Center(
                      child: Container(
                          width: 60,
                          height: 60,
                          child: CircularProgressIndicator()),
                    );
                  } else {
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
                  }
                },
                staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                padding: EdgeInsets.all(20.0),
              )),
        ));
  }

  void loadMore() {
    setState(() {
      if ((present + perPage) > originalItems.length) {
        items.addAll(originalItems.getRange(present, originalItems.length));
      } else {
        items.addAll(originalItems.getRange(present, present + perPage));
      }
      present = present + perPage;
    });
  }
}
