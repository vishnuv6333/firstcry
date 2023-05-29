import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'constant/custom_icon.dart';
import 'constant/utlities.dart';
import 'homepage.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  final page = [const HomePage()];
  final dynamic _bottomNavIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            leadingWidth: 200,
            leading: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: CircleAvatar(
                      radius: 17,
                      child: Image.asset("assets/img/pall_new.png"), //Text
                    ), //CircleAvatar
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: const [
                        Text(
                          "Shop for",
                          style: TextStyle(color: Colors.black, fontSize: 13),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.black,
                          size: 17,
                        )
                      ],
                    ),
                    const Text(
                      "All",
                      style: TextStyle(color: Colors.black, fontSize: 11),
                    )
                  ],
                )
              ],
            ),
            backgroundColor: Colors.white,
            actions: const [
              UtiLties(type: "home"),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: HexColor('#ff7043'),
            unselectedItemColor: Colors.black,
            currentIndex: 0,
            items: [
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child:
                        Icon(Icons.home, size: 18, color: HexColor('#ff7043')),
                  ),
                  label: 'Shopping'),
              const BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(bottom: 4),
                    child: Icon(Icons.play_circle_fill_outlined, size: 18),
                  ),
                  label: 'Explore'),
              const BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(bottom: 4),
                    child: Icon(IconCustom.heartempty,
                        size: 18, color: Colors.black),
                  ),
                  label: 'Parenting'),
              const BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(bottom: 4),
                    child: Icon(IconCustom.useroutline,
                        size: 18, color: Colors.black),
                  ),
                  label: 'Profile'),
              const BottomNavigationBarItem(
                  icon: Icon(IconCustom.menu, size: 18, color: Colors.black),
                  label: 'Menu'),
            ],
          ),
          body: page[_bottomNavIndex]),
    );
  }
}
