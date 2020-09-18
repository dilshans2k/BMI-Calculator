import 'package:flutter/material.dart';

import '../constants/constants.dart';



class IconContent extends StatelessWidget {
  const IconContent({this.icon, this.text});
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          text,
          style: klabelTextStyle,
        )
      ],
    );
  }
}
