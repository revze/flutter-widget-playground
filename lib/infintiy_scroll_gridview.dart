import 'package:flutter/material.dart';

class InfinityScrollGridViewScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _InfinityScrollGridViewState();
  }
}

class _InfinityScrollGridViewState extends State {
  int perPage = 10;
  int present = 0;
  final originalItems = List<String>.generate(50, (i) => 'Text $i');
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
        title: Text('Infinity Scroll GridView'),
      ),
      body: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scrollInfo) {
            if (scrollInfo.metrics.pixels ==
                scrollInfo.metrics.maxScrollExtent) {
              Future.delayed(Duration(milliseconds: 1000), loadMore);
            }
          },
          child: GridView.builder(
            itemCount: (present <= originalItems.length)
                ? items.length + 1
                : items.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 1, crossAxisSpacing: 10, mainAxisSpacing: 10),
//            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              var text = (index % 2 == 0)
                  ? 'Grumpy wizards make toxic brew for the evil Queen and Jack'
                  : "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam";
              Color color2 = (index % 2 == 0) ? Colors.green : Colors.red;
              color2 = (index % 3 == 0) ? Colors.yellow : Colors.amber;

              if (index == items.length) {
                return Container(
                  child: Center(
                    child: Container(
                      width: 50,
                      height: 50,
                      child: CircularProgressIndicator(),
                    ),
                  ),
                );
              } else {
                return Card(
                    child: Column(
                      children: <Widget>[
                        Image.network("https://picsum.photos/700/500"),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Text(text, overflow: TextOverflow.ellipsis,),
                        )
                      ],
                    ),
                    margin: EdgeInsets.all(0));
              }
            },
          )),
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
