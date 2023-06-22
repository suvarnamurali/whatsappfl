
import 'package:flutter/material.dart';
 
class UilityWidget {
  //This custom widget method creates a sized box of the given height
  heightSpacer(double height) {
    return SizedBox(
      height: height,
    );
  }
  //This custom widget method creates a sized box of the given width
  widthSpacer(double width) {
    return SizedBox(
      width: width,
    );
  }
}