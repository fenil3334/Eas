import 'package:eastern_interview/controler/bottom_navigation_controler.dart';
import 'package:eastern_interview/screen/more_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomNaigation extends StatelessWidget {
  CustomBottomNaigation({Key? key}) : super(key: key);

  BottomNavigationControler controler=Get.put(BottomNavigationControler());



  List<Widget> _pages = [
    MoreScreen('assets/images/home_fil.png','Home'),
    MoreScreen('assets/images/setting_fil.png','Test'),
    MoreScreen('assets/images/setting_fil.png','Setting'),
    MoreScreen('assets/images/more_fil.png',"More"),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BottomNavigationBar')),
      body: Obx((){
        return _pages[controler.selectMenuIndex.value];
      }),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 1.0,

        clipBehavior: Clip.antiAlias,
        child: Container(
          height: kBottomNavigationBarHeight,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(
                  color: Colors.grey,
                  width: 0.2,
                ),
              ),
            ),
            child: Obx((){
              return Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [


                  cusNavMenu(controler.selectMenuIndex.value==0 ? 'assets/images/home_fil.png' : 'assets/images/home_unfil.png', 'Home',(){
                    controler.selectMenuIndex.value=0;
                  }),


                  cusNavMenu(controler.selectMenuIndex.value==1 ? 'assets/images/setting_fil.png' : 'assets/images/setting_unfil.png', 'Test',(){
                    controler.selectMenuIndex.value=1;
                  }),


                  Expanded(
                    child: Container(),
                  ),


                  cusNavMenu(controler.selectMenuIndex.value==2 ? 'assets/images/setting_fil.png' : 'assets/images/setting_unfil.png', 'Setting',(){
                    controler.selectMenuIndex.value=2;
                  }),


                  cusNavMenu(controler.selectMenuIndex.value==3 ? 'assets/images/more_fil.png' : 'assets/images/more_unfil.png', 'More',(){
                    controler.selectMenuIndex.value=3;
                  })
                ],
              );
            }),
          ),
        ),
      ),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(3.0),
        child: FloatingActionButton(
          elevation: 0,
          backgroundColor:Colors.transparent,
          onPressed: () {  },
          child: Image.asset('assets/images/add.png'),
        ),
      ),
    );
  }



  Widget cusNavMenu(String image,String title,OnTap onTap){
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image,width: 20,),

            Text(title,style: TextStyle(color: Colors.black,fontSize: 11),)
          ],
        ),
      ),
    );
  }

}


typedef OnTap();