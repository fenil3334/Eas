import 'package:eastern_interview/cubit/categorycubit/category_cubit.dart';
import 'package:eastern_interview/cubit/categorycubit/category_state.dart';
import 'package:eastern_interview/datamodel/category_datamodel.dart';
import 'package:eastern_interview/res/color.dart';
import 'package:eastern_interview/res/strings.dart';
import 'package:eastern_interview/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
          child: Column(
        children: [
          _toolbar(context),
          BlocProvider<CategoryCubit>(
            create: (context) => CategoryCubit()..getCategoryList(),
            child: _listview(),
          ),
        ],
      )),
    );
  }

  Widget _toolbar(BuildContext context) {
    return Container(
      height: SizeUtils.verticleSize * 7,
      color: AppColor.white,
      child: Padding(
        padding: EdgeInsets.only(left: SizeUtils.horizontalSize * 4, right: SizeUtils.horizontalSize * 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/images/back.png',
              height: 20,
              width: 20,
            ),
            Expanded(
                child: Text(
              Strings.category,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
            )),
            Row(
              children: [
                Image.asset(
                  'assets/images/search.png',
                  height: 22,
                  width: 22,
                ),
                SizedBox(
                  width: SizeUtils.horizontalSize * 5,
                ),
                Stack(
                  children: [
                    SizedBox(
                      height: 33,
                      width: 33,
                      child: Align(
                        alignment: Alignment.center,
                        child: Image.asset(
                          'assets/images/bag.png',
                          height: 22,
                          width: 22,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        height: 15,
                        width: 15,
                        decoration: BoxDecoration(
                            color: AppColor.grey, borderRadius: const BorderRadius.all(Radius.circular(100))),
                        child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              '1',
                              style: TextStyle(color: AppColor.white, fontSize: 9),
                            )),
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _listview() {
    return BlocBuilder<CategoryCubit, CategoryState>(builder: (context, state) {
      if (state is OnLoading) {
        return  const Expanded(
          child: Center(child: CircularProgressIndicator()),
        );
      } else if (state is OnSuccess) {
        return ListView.builder(
          shrinkWrap: true,
            itemCount: state.categoryDataModel.categories!.length,
            itemBuilder: (context, index) {
              Categories categories = state.categoryDataModel.categories![index];
              return Column(
                children: [
                  Container(
                      height: SizeUtils.verticleSize * 15,
                      color: AppColor.lightred,
                      child: Row(
                        children: [
                          Container(
                            width: SizeUtils.horizontalSize * 60,
                            height: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                    bottomRight: Radius.circular(100), topRight: Radius.circular(100)),
                                color: AppColor.red),
                            padding: EdgeInsets.only(left: SizeUtils.horizontalSize * 8),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                categories.categoryName.toString(),
                                style: TextStyle(color: AppColor.black, fontSize: 16),
                              ),
                            ),
                          ),
                        ],
                      )),
                  Container(
                    color: AppColor.white,
                    height: SizeUtils.verticleSize * 0.1,
                  )
                ],
              );
            });
      } else {
        return const Center(
          child: Text("state.categoryDataModel.categories"),
        );
      }
    });
  }
}
