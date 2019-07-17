import 'package:flutter/material.dart';

class InfinityScrollListViewScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _InfinityScrollListViewState();
  }
}

class _InfinityScrollListViewState extends State {
  int present = 0;
  int perPage = 10;

  final originalItems = List<String>.generate(10000, (i) => 'Item $i');
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
        title: Text('Infinity Scroll ListView'),
      ),
      body: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scrollInfo) {
            if (scrollInfo.metrics.pixels ==
                scrollInfo.metrics.maxScrollExtent) {
              var future =
                  Future.delayed(Duration(milliseconds: 1000), loadMore);
            }
          },
          child: ListView.builder(
              itemCount: (present <= originalItems.length)
                  ? items.length + 1
                  : items.length,
              itemBuilder: (context, index) {
                return (index == items.length)
                    ? Center(
                        child: Container(
                        width: 50,
                        height: 50,
                        margin: EdgeInsets.only(top: 15, bottom: 15),
                        child: CircularProgressIndicator(),
                      ))
                    : ListTile(
                        title: Text(items[index]),
                      );
              })),
    );
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
