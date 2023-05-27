import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.white,
            // selectedLabelStyle: AppThemes().textThemes.headline1,
            // unselectedLabelStyle: AppThemes().textThemes.headline1,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: HexColor('#ff7043'),
            unselectedItemColor: Colors.black,
            currentIndex: 0,
            // onTap: _onItemTapped,
            items: [
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child:
                        Icon(Icons.home, size: 18, color: HexColor('#ff7043')),
                  ),
                  label: ' Home'),
              const BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(bottom: 4),
                    child: Icon(Icons.play_circle_fill_outlined, size: 18),
                  ),
                  label: '   Movies'),
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Icon(Icons.heart_broken_sharp,
                        size: 18, color: HexColor('#ff7043')),
                  ),
                  label: ' Theatres'),
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Icon(Icons.abc_sharp,
                        size: 18, color: HexColor('#ff7043')),
                  ),
                  label: '    Booking'),
              BottomNavigationBarItem(
                  icon: Padding(
                    padding:
                        const EdgeInsets.only(right: 8.0, bottom: 9, top: 8),
                    child:
                        Icon(Icons.more, size: 8, color: HexColor('#ff7043')),
                  ),
                  label: '      More'),
            ],
          ),
          body: Column()),
    );
  }
}
