import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
class CarouselWithDot extends StatefulWidget {
  final List<String> imageUrl ;
  const CarouselWithDot({
    required this.imageUrl ,
    super.key});

  @override
  State<CarouselWithDot> createState() => _CarouselWithDotState();
}

class _CarouselWithDotState extends State<CarouselWithDot> {

  int currentIndex = 0 ;
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              height: 200, // Adjust height as needed
              autoPlay: true, // Set to true for automatic sliding
              enlargeCenterPage: true,
              enlargeFactor: 0.2,
              // Make the centered item larger
              aspectRatio: 9/16, // Set aspect ratio as needed
              viewportFraction: 0.9, // Set the fraction of the viewport to show
              initialPage: 0, // Set the initial page
              enableInfiniteScroll: true,
              onPageChanged: (index ,reason){
                setState(() {
                  currentIndex = index ;
                });
              }// Enable infinite scroll
          ),
          items: widget.imageUrl.map((imageUrl) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.imageUrl.map((image) {
            int index = widget.imageUrl.indexOf(image);
            return Container(
              width: 8.0,
              height: 8.0,
              margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: currentIndex == index ? Colors.blueAccent : Colors.grey,
              ),
            );
          }).toList(),
        ),
      ],
    );

  }
}
