import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Sliders extends StatefulWidget {
  Sliders({Key? key, required this.home, this.slider}) : super(key: key);
  List home;
  var slider;

  @override
  State<Sliders> createState() => _SlidersState();
}

class _SlidersState extends State<Sliders> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: () {},
          child: CarouselSlider(
            items: widget.home
                .map(
                  (item) => Image.asset(
                    item['image_path'],
                    fit: BoxFit.fill,
                    width: double.infinity,
                  ),
                )
                .toList(),
            carouselController: widget.slider,
            options: CarouselOptions(
              scrollPhysics: const BouncingScrollPhysics(),
              autoPlay: true,
              aspectRatio: 1,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.home.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => widget.slider.animateToPage(entry.key),
                child: Container(
                  width: 7,
                  height: 7.0,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 3.0,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: currentIndex == entry.key
                          ? Colors.white
                          : Colors.grey),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
