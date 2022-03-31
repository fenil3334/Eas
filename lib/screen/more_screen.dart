import 'package:eastern_interview/res/color.dart';
import 'package:eastern_interview/utils/size_utils.dart';
import 'package:flutter/material.dart';

class MoreScreen extends StatefulWidget {
  String image,title;
  MoreScreen(this.image, this.title, {Key? key}) : super(key: key);

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                widget.image,
                height: SizeUtils.horizontalSize*8,
                width: SizeUtils.horizontalSize*8,
              ),

              SizedBox(height: SizeUtils.verticleSize*1.4,),

              Text(widget.title,style: TextStyle(color: AppColor.black,fontSize: 14),),
            ],
          ),
        ),
      ),
    );
  }
}
