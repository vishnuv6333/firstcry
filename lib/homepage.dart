import 'package:carousel_slider/carousel_slider.dart';
import 'package:firstcry/grid.dart';
import 'package:firstcry/slider.dart';
import 'package:flutter/material.dart';

import 'constant/custom_icon.dart';
import 'constant/dummy.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CarouselController carouselController = CarouselController();

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
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
                              ? Advertisement(
                                  home: home[index]['listBanner'],
                                  type: home[index]['isCard'])
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

// ignore: must_be_immutable
class Advertisement extends StatelessWidget {
  final List home;

  final bool type;

  const Advertisement({
    Key? key,
    required this.home,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: type != true
          ? MediaQuery.of(context).size.height / 10
          : MediaQuery.of(context).size.height / 3.5,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: home.length,
          itemBuilder: ((context, index) {
            return Container(
                margin: const EdgeInsets.all(10),
                width: type != true
                    ? MediaQuery.of(context).size.width - 50
                    : MediaQuery.of(context).size.width - 250,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(9)),
                    image: DecorationImage(
                      image: AssetImage(home[index]["image_path"]),
                      fit: BoxFit.fill,
                    )));
          })),
    );
  }
}

class BannerImage extends StatelessWidget {
  const BannerImage({
    Key? key,
    this.home,
  }) : super(key: key);
  final dynamic home;
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
