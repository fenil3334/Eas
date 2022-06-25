import 'dart:io';
import 'dart:typed_data';

import 'package:eastern_interview/res/color.dart';
import 'package:eastern_interview/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class MoreScreen extends StatefulWidget {
  String image,title;
  MoreScreen(this.image, this.title, {Key? key}) : super(key: key);

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  File? videofile;
  String? pathimage;

  @override
  void initState() {
    super.initState();
    genThumbnailFile();
    _getImage();
  }
  
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              videofile!=null ? Image.file(videofile!,height: 200,width: 200) : Image.asset(
                widget.image,
                height: SizeUtils.horizontalSize*8,
                width: SizeUtils.horizontalSize*8,
              ),


              pathimage!=null ? Image.network(pathimage!) : Container(),

              SizedBox(height: SizeUtils.verticleSize*1.4,),

              Text(widget.title,style: TextStyle(color: AppColor.black,fontSize: 14),),
            ],
          ),
        ),
      ),
    );
  }


  Future genThumbnailFile() async{
    final thumbnail = await VideoThumbnail.thumbnailFile(
        video:
        "https://www.statuslagao.com/whatsapp/videos/new/new-whatsapp-status-video-849.mp4",
        imageFormat: ImageFormat.JPEG,
        //maxHeightOrWidth: 0,
        maxHeight:200,
        maxWidth: 200,
        quality: 10);


/*    Uint8List bytes = await VideoThumbnail(
        "https://file-examples-com.github.io/uploads/2017/04/file_example_MP4_480_1_5MG.mp4"
    );*/
  }

  _getImage() async {
    var appDocDir = await getApplicationDocumentsDirectory();
    final folderPath = appDocDir.path;


    final thumbnail = await VideoThumbnail.thumbnailFile(
        video:
        "https://www.statuslagao.com/whatsapp/videos/new/new-whatsapp-status-video-849.mp4",
        imageFormat: ImageFormat.JPEG,
        thumbnailPath: folderPath,
        maxHeight:200,
        maxWidth: 200,
        quality: 100);
    setState(() {
      print('---------thumb-----${thumbnail}');
      videofile = File(thumbnail!);
    });
  }
}
