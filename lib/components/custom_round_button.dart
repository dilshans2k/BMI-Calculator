import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.iconType, this.onPress});
  final IconData iconType;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 10,
      constraints: BoxConstraints(minWidth: 56, minHeight: 56),
      onPressed: onPress,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      child: Icon(iconType),
    );
  }
}
