import 'package:carousel_slider/carousel_slider.dart';
import 'package:firstcry/constant/utlities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../constant/dummy.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  // ignore: use_function_type_syntax_for_parameters

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: SizedBox(
              height: 40,
              width: 70,
              child: Image.asset('assets/img/fc-logo.png')),
          iconTheme: const IconThemeData(
            color: Colors.black, //change your color here
          ),
          backgroundColor: Colors.white,
          actions: const [UtiLties(type: "product")]),
      bottomNavigationBar: InkWell(
        onTap: () async {},
        child: Container(
          height: 50,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            color: Colors.black,
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50),
                child: Container(
                  color: Colors.white,
                  child: Row(
                    children: const [
                      Text("1"),
                      Icon(Icons.keyboard_arrow_down)
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.orange,
                  child: const Center(
                      child: Text(
                    "ADD TO CART",
                    style:
                        TextStyle(color: Colors.white, fontFamily: " Axiforma"),
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                InkWell(
                  onTap: () {},
                  child: CarouselSlider(
                    items: (product['listBanner'] as List<Map<String, Object>>)
                        .map(
                          (item) => Image.asset(
                            item['image_path'].toString(),
                            fit: BoxFit.fill,
                            width: double.infinity,
                          ),
                        )
                        .toList(),
                    carouselController: carouselController,
                    options: CarouselOptions(
                      scrollPhysics: const BouncingScrollPhysics(),
                      autoPlay: false,
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
                      children: [
                        GestureDetector(
                          child: Container(
                            width: 40,
                            height: 20,
                            margin: const EdgeInsets.symmetric(
                              horizontal: 3.0,
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '${currentIndex + 1}'
                                  '/'
                                  '${(product['listBanner'] as List<Map<String, Object>>).length}',
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        )
                      ]),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(2), // Apply border radius
                      color: const Color.fromARGB(255, 235, 213,
                          14), // Set the background color of the container
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(4),
                      child: Text(
                        "Best seller",
                        style: TextStyle(fontSize: 11),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(product['name'].toString()),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.currency_rupee_sharp,
                          size: 14, // Set the size of the icon
                          color: Colors.black, // Set the color of the icon
                        ),
                        Text(product['price'].toString())
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      children: [
                        const Text("MRP:"),
                        const Icon(
                          Icons.currency_rupee_sharp,
                          size: 14,
                          color: Colors.black,
                        ),
                        Text(
                          product['mrp'].toString(),
                          style: const TextStyle(
                            decoration: TextDecoration.lineThrough,
                            decorationColor: Colors.black,
                            decorationThickness: 2.0,
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          product['discount'].toString() + '%' + ' OFF',
                          style: const TextStyle(color: Colors.orange),
                        )
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text(
                      "MRP incl. all taxes, Add'l charges may apply on discounted price",
                      style: TextStyle(fontSize: 10),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: RatingBar.builder(
                      initialRating: 3,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 18,
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {},
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      product['rating'].toString() +
                          " Rating" +
                          " & " +
                          product['review'].toString() +
                          " Reviews",
                      style: const TextStyle(fontSize: 11),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              color: Colors.grey, // Set the color of the line
              thickness: 5.0, // Set the thickness of the line
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 10,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 2,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8)),
                              color: const Color.fromARGB(201, 255, 240, 108),
                              border: Border.all(
                                color: Colors.yellow,
                                width: 2.0,
                              ),
                            ),
                            height: 100,
                            width: 350,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 80,
                                  width: 20,
                                  color: Colors.yellow,
                                  child: const RotatedBox(
                                    quarterTurns: 3,
                                    child: Align(
                                        alignment: Alignment.center,
                                        child: Text("OFFERS")),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        height: 24,
                                        width: 100,
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(10.0),
                                            bottomRight: Radius.circular(10.0),
                                          ),
                                          color: Color.fromARGB(255, 9, 41, 68),
                                        ),
                                        child: const Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "Use Code :   5HAJ",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 8),
                                          ),
                                        )),
                                    const Text("Extra 5% 0ff* on Select Range"),
                                    SizedBox(
                                      width: 200,
                                      height: 2,
                                      child: Container(
                                        decoration: const BoxDecoration(
                                            color: Colors.yellow,
                                            gradient: LinearGradient(
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                                colors: [
                                                  Colors.yellow,
                                                  Colors.yellow,
                                                  Colors.yellow,
                                                ])),
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(bottom: 4.0),
                                      child:
                                          Text("Extra 5% 0ff* on Select Range"),
                                    )
                                  ],
                                ),
                                const Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "T & C Apply",
                                      style: TextStyle(fontSize: 9),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Row(
                        children: [
                          const Text("COLOR  "),
                          Container(
                            width: 18,
                            height: 18,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                                width: 1,
                              ),
                            ), // Set the background color of the outer rectangle box
                            child: Center(
                              child: Container(
                                margin: const EdgeInsets.all(3),
                                width: 150,
                                height: 150,
                                color: Colors
                                    .blue, // Set the background color of the inner rectangle
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 6,
                          itemBuilder: ((context, index) {
                            return Container(
                                margin:
                                    const EdgeInsets.only(right: 10, top: 10),
                                child: Image.asset("assets/img/bag.webp"));
                          })),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
