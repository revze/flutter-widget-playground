import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselSliderApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CarouselSliderState();
  }
}

class _CarouselSliderState extends State {
  List<String> slides = [
    "https://picsum.photos/id/237/900/500",
    "https://picsum.photos/id/236/900/500",
    "https://picsum.photos/id/235/900/500",
    "https://picsum.photos/id/234/900/500"
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('Carousel Slider'),
        ),
        body: Container(
          margin: EdgeInsets.only(top: 20),
          child: CarouselSlider(
              height: 150,
              autoPlay: true,
              enableInfiniteScroll: true,
              items: slides.map((i) {
                return Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      image: DecorationImage(
                          image: NetworkImage(i), fit: BoxFit.cover)),
                );
              }).toList()))
        );
  }
}
