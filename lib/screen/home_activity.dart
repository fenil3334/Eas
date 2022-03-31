import 'package:eastern_interview/res/strings.dart';
import 'package:eastern_interview/screen/category_screen.dart';
import 'package:eastern_interview/screen/home_screen.dart';
import 'package:eastern_interview/screen/more_screen.dart';
import 'package:eastern_interview/utils/size_utils.dart';
import 'package:eastern_interview/widget/bottom_navigation.dart';
import 'package:flutter/material.dart';

class HomeActivity extends StatefulWidget {
   const HomeActivity({Key? key}) : super(key: key);

  @override
  State<HomeActivity> createState() => _HomeActivityState();
}

class _HomeActivityState extends State<HomeActivity> {
  int _currentIndex = 0;

   List<Widget> tabPages = [
     HomeScreen(),
     const CategoryScreen(),
     MoreScreen('assets/images/curate.png',Strings.curate),
     MoreScreen('assets/images/sale.png',Strings.sale),
     MoreScreen('assets/images/more.png',Strings.more),
   ];



  @override
  Widget build(BuildContext context) {
    SizeUtils().sizeutil(context);
    return Material(
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Expanded(child: tabPages.elementAt(_currentIndex),)
            ],
          ),
          bottomNavigationBar: BottomNavigation(
            currentIndex: _currentIndex,
              onPress: onPress
          ),
        ),
      ),
    );
  }







  onPress(index){
    setState(() {
      _currentIndex = index;
    });
  }
}



