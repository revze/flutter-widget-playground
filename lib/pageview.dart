import 'package:flutter/material.dart';

class PageViewApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: PageViewScreen(),
    );
  }
}

class PageViewScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PageViewScreenState();
  }
}

class _PageViewScreenState extends State {
  int _currentPage = 0;
  var pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('PageView'),
      ),
      body: PageView(
        onPageChanged: onViewPageChanged,
        controller: pageController,
        children: <Widget>[
          Container(
            color: Colors.grey,
            child: ListWidget(10),
          ),
          Container(
            color: Colors.cyan,
          ),
          Container(
            color: Colors.grey,
            child: ListWidget(3),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped,
          currentIndex: _currentPage,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home), title: Text('Home')),
            BottomNavigationBarItem(
                icon: Icon(Icons.mail), title: Text('Messages')),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), title: Text('Profile')),
          ]),
    );
  }

  void onTabTapped(int index) {
    pageController.animateToPage(index,
        duration: Duration(milliseconds: 400), curve: Curves.easeIn);
    setState(() {
      _currentPage = index;
    });
  }

  void onViewPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }
}

class ListWidget extends StatelessWidget {
  int _itemCount;

  ListWidget(this._itemCount);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
        itemCount: _itemCount,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              color: Colors.white,
              padding: EdgeInsets.all(10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 60,
                    height: 60,
                    margin: EdgeInsets.only(right: 15),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                                "https://picsum.photos/id/400/600"))),
                  ),
                  Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(padding: EdgeInsets.only(bottom: 10), child: Text('Revando', style: TextStyle(fontSize: 14),)),
                          Text(
                              'Lorem Ipsum Dolor Sit Amet Lorem Ipsum Dolor Sit Amet Lorem Ipsum Dolor Sit Amet',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey)),
                        ],
                      ))
                ],
              ));
        });
  }
}
