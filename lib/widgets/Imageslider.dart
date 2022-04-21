import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider({Key? key}) : super(key: key);

  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  final List<String> imageList = [
    'images/weather_6.jpg','images/weather_5.jpg','images/weather_3.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return imageList.isNotEmpty?
      CarouselSlider.builder(
        itemCount: imageList.length,
        options: CarouselOptions(
          enlargeCenterPage: true,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          reverse: true,
          aspectRatio: 6/3
        ),
        itemBuilder: (context, i, id) {
          //for onTap to redirect to another screen
          return GestureDetector(
            child: _container(imageList,i),
            onTap: () {
              var url = imageList[i];
              print('url index-${url.toString()}');
            },
          );
        },
      )
        :const Center(child: CircularProgressIndicator(
      backgroundColor: Colors.blue,
    ),);
      // This trailing comma makes auto-formatting nicer for build methods.

  }
  Container _container(List imageList,int i){
    return  Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.white,
          )),
      //ClipRRect for image border radius
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.asset(
          imageList[i],
          width: 500,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
