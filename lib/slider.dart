import 'package:carousel_slider/carousel_slider.dart';
import 'package:firstcry/product/productpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Sliders extends StatefulWidget {
  const Sliders({Key? key, required this.home, required this.slider})
      : super(key: key);
  final List home;
  // ignore: prefer_typing_uninitialized_variables
  final slider;

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
          onTap: () {
            Get.to(const ProductPage());
          },
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
