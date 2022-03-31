import 'package:eastern_interview/res/color.dart';
import 'package:eastern_interview/res/strings.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  int currentIndex=0;
  final Function onPress;

  BottomNavigation({Key? key, required this.currentIndex, required this.onPress}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  void _onItemTapped(int index) {
    setState(() {
      widget.currentIndex = index;
      widget.onPress(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: AppColor.darkgreen,
        unselectedItemColor: Colors.black.withOpacity(.60),
        selectedFontSize: 10,
        unselectedFontSize: 9,
        onTap: _onItemTapped,
        currentIndex: widget.currentIndex,

        items: [
          BottomNavigationBarItem(
            label: Strings.home,
            icon: Padding(
              padding: const EdgeInsets.all(2),
              child: Image.asset(
                "assets/images/home.png",
                height: 20,
                width: 20,
                color: widget.currentIndex == 0 ? AppColor.darkgreen : AppColor.grey,
              ),
            ),
          ),
          BottomNavigationBarItem(
            label: Strings.category,
            icon: Padding(
              padding: const EdgeInsets.all(2),
              child: Image.asset(
                "assets/images/category.png",
                height: 20,
                width: 20,
                color: widget.currentIndex == 1 ? AppColor.darkgreen : AppColor.grey,
              ),
            ),
          ),
          BottomNavigationBarItem(
            label: Strings.curate,
            icon: Padding(
              padding: const EdgeInsets.all(2),
              child: Image.asset(
                "assets/images/curate.png",
                height: 20,
                width: 20,
                color: widget.currentIndex == 2 ? AppColor.darkgreen : AppColor.grey,
              ),
            ),
          ),
          BottomNavigationBarItem(
            label: Strings.sale,
            icon: Padding(
              padding: const EdgeInsets.all(2),
              child: Image.asset(
                "assets/images/sale.png",
                height: 20,
                width: 20,
                color: widget.currentIndex == 3 ? AppColor.darkgreen : AppColor.grey,
              ),
            ),
          ),
          BottomNavigationBarItem(
            label: Strings.more,
            icon: Padding(
              padding: const EdgeInsets.all(2),
              child: Image.asset(
                "assets/images/more.png",
                height: 20,
                width: 20,
                color: widget.currentIndex == 4 ? AppColor.darkgreen : AppColor.grey,
              ),
            ),
          ),
        ]);
  }
}
