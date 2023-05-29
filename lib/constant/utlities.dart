import 'package:flutter/material.dart';

import 'custom_icon.dart';

class UtiLties extends StatelessWidget {
  const UtiLties({
    Key? key,
    required this.type,
  }) : super(key: key);
  final String type;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(
            SearchIcon.search,
            color: Colors.black,
          ),
        ),
        type != 'product'
            ? const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(IconCustom.heartempty, color: Colors.black),
              )
            : const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Share.share, color: Colors.black),
              ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(IconCustom.cart, color: Colors.black),
        ),
      ],
    );
  }
}
