import 'package:flutter/material.dart';

class SizeUtils{
  static late double screenwidth;
  static late double screenheight;
  static late double horizontalSize;
  static late double verticleSize;

  void sizeutil(BuildContext context){
    screenwidth=MediaQuery.of(context).size.width;
    screenheight=MediaQuery.of(context).size.height;
    horizontalSize=screenwidth/100;
    verticleSize=screenheight/100;
  }
}