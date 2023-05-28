import 'package:flutter/material.dart';

class GridItem extends StatelessWidget {
  GridItem(
      {Key? key,
      required this.home,
      required this.category,
      required this.columCount})
      : super(key: key);
  List home;
  bool category;
  int columCount;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.only(bottom: 4),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: home.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: columCount,
          mainAxisSpacing: 0,
          crossAxisSpacing: category == true ? 1 : 0,
          childAspectRatio: (1 / .7)),
      itemBuilder: (BuildContext context, int index) {
        return Container(
            margin: EdgeInsets.all(category == true ? 2 : 0),
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage(home[index]["image_path"]),
              fit: category == true ? BoxFit.contain : BoxFit.fill,
            )));
      },
    );
  }
}
