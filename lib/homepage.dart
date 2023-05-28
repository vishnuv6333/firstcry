import 'package:carousel_slider/carousel_slider.dart';
import 'package:firstcry/grid.dart';
import 'package:firstcry/slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'constant/custom_icon.dart';
import 'constant/dummy.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CarouselController carouselController = CarouselController();

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: const Color.fromARGB(225, 224, 224, 222),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: const [
                      Icon(
                        Location.location,
                        size: 17,
                      ),
                      Text("Delivery to - 670671")
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.black,
                    size: 17,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: home.length,
                itemBuilder: ((context, index) {
                  var type = home[index]['type'];
                  return type == 'banner'
                      ? BannerImage(home: home[index]['image_path'])
                      : type == 'slider'
                          ? Sliders(
                              home: home[index]['listBanner'],
                              slider: carouselController)
                          : type == 'advertisment'
                              ? const Advertisement()
                              : type == 'grid'
                                  ? GridItem(
                                      home: home[index]['gridImage'],
                                      category: home[index]['category'],
                                      columCount: home[index]['columnCount'])
                                  : type == 'Text'
                                      ? const Align(
                                          alignment: Alignment.center,
                                          child: Text('Shop By Category'))
                                      : const SizedBox();
                })),
          ),
        ],
      ),
    );
  }
}

class Advertisement extends StatelessWidget {
  const Advertisement({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 10,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: 3,
          itemBuilder: ((context, index) {
            return Container(
                margin: const EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width - 50,
                height: 10,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(9)),
                    image: DecorationImage(
                      image: AssetImage("assets/img/adv.png"),
                      fit: BoxFit.fill,
                    )));
          })),
    );
  }
}

class BannerImage extends StatelessWidget {
  var home;

  BannerImage({
    Key? key,
    this.home,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 11),
        height: MediaQuery.of(context).size.height / 10,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage(home),
          fit: BoxFit.fill,
        )));
  }
}
