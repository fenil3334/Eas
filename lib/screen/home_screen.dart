import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:eastern_interview/cubit/home_screen_cubit/home_bottom_cubit.dart';
import 'package:eastern_interview/cubit/home_screen_cubit/home_middle_cubit.dart';
import 'package:eastern_interview/cubit/home_screen_cubit/home_screen_state.dart';
import 'package:eastern_interview/cubit/home_screen_cubit/home_top_cubit.dart';
import 'package:eastern_interview/datamodel/bottom_datamodel.dart';
import 'package:eastern_interview/datamodel/middle_datamodel.dart';
import 'package:eastern_interview/datamodel/top_datamodel.dart';
import 'package:eastern_interview/res/color.dart';
import 'package:eastern_interview/res/strings.dart';
import 'package:eastern_interview/utils/size_utils.dart';
import 'package:eastern_interview/widget/dotindicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  static const _kDuration = Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeScreenMiddleCubit>(
          create: (context) => HomeScreenMiddleCubit()..getMiddleMenu(),
        ),
        BlocProvider<HomeScreenCubit>(
          create: (context) => HomeScreenCubit()..getTopMenu(),
        ),
        BlocProvider<HomeScreenBottomCubit>(
          create: (context) => HomeScreenBottomCubit()..getBottomMenu(),
        ),
      ],
      child: Material(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [_toolbar(context), _topmenu(), _middlemenu(), _bottomMenu()],
            ),
          ),
        ),
      ),
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

  Widget _topmenu() {
    return BlocBuilder<HomeScreenCubit, HomeScreenState>(builder: (context, state) {
      if (state is OnLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is OnSuccessTopMenu) {
        return Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 12),
              height: SizeUtils.verticleSize * 15,
              child: ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(right: 12),
                  scrollDirection: Axis.horizontal,
                  itemCount: state.categoryDataModel.mainStickyMenu!.length,
                  itemBuilder: (context, index) {
                    MainStickyMenu mainStickyMenu = state.categoryDataModel.mainStickyMenu![index];

                    return Container(
                      margin: const EdgeInsets.only(left: 10, bottom: 10),
                      width: SizeUtils.horizontalSize * 35,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(5)),
                        color: AppColor.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 1.0,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.only(topLeft: Radius.circular(6), topRight: Radius.circular(5)),
                              child: CachedNetworkImage(
                                imageUrl: mainStickyMenu.image.toString(),
                                placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                                errorWidget: (context, url, error) => const Icon(Icons.error),
                                width: double.infinity,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: SizeUtils.verticleSize * 4,
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                mainStickyMenu.title.toString(),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(color: AppColor.black, fontSize: 14, fontWeight: FontWeight.w300),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: SizeUtils.verticleSize * 1.5,
            ),
            CarouselSlider.builder(
              itemCount: state.categoryDataModel.offerCodeBanner!.length,
              options: CarouselOptions(
                enlargeCenterPage: true,
                height: 190,
                autoPlay: false,
                reverse: false,
                aspectRatio: 5.0,
              ),
              itemBuilder: (context, i, id) {
                return GestureDetector(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      state.categoryDataModel.offerCodeBanner![i].bannerImage.toString(),
                      fit: BoxFit.cover,
                    ),
                  ),
                  onTap: () {},
                );
              },
            ),
          ],
        );
      } else {
        return const Center(
          child: Text("state.categoryDataModel.categories"),
        );
      }
    });
  }

  Widget _middlemenu() {
    return BlocBuilder<HomeScreenMiddleCubit, HomeScreenState>(builder: (context, state) {
      if (state is OnFailed) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is OnSuccessMiddleMenu) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12, top: 16, bottom: 6),
              child: Align(alignment: Alignment.centerLeft, child: Text(Strings.shopbycategory)),
            ),
            Container(
              margin: const EdgeInsets.only(top: 12),
              height: SizeUtils.verticleSize * 29,
              child: ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(right: 12),
                  scrollDirection: Axis.horizontal,
                  itemCount: state.middleDataModel.category!.length,
                  itemBuilder: (context, index) {
                    Category category = state.middleDataModel.category![index];

                    return Container(
                      margin: const EdgeInsets.only(left: 10, bottom: 10),
                      width: SizeUtils.horizontalSize * 36,
                      color: AppColor.white,
                      child: Column(
                        children: [
                          Expanded(
                            child: CachedNetworkImage(
                              imageUrl: category.image.toString(),
                              placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                              errorWidget: (context, url, error) => const Icon(Icons.error),
                              width: double.infinity,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 10),
                            color: AppColor.lightpink,
                            width: double.infinity,
                            height: SizeUtils.verticleSize * 7.6,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  category.name.toString(),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(color: AppColor.black, fontSize: 14, fontWeight: FontWeight.w300),
                                ),
                                Text(
                                  "EXPLORE",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(color: AppColor.black, fontSize: 9, fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
            unstitched(state.middleDataModel.unstitched),
            boutique(state.middleDataModel.boutiqueCollection),
          ],
        );
      } else {
        return const Center();
      }
    });
  }

  Widget unstitched(List<Unstitched>? unstitched) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12, top: 17, bottom: 10),
          child: Align(alignment: Alignment.centerLeft, child: Text(Strings.unstitched)),
        ),

        CarouselSlider.builder(
          itemCount: unstitched!.length,
          options: CarouselOptions(
            enlargeCenterPage: true,
            aspectRatio: 16/9,
            viewportFraction: 0.8,
            height: 220,
            autoPlay: false,
            reverse: false,
          ),
          itemBuilder: (context, i, id) {
            return GestureDetector(
              child: Image.network(
                unstitched[i].image.toString(),
                fit: BoxFit.cover,
              ),
              onTap: () {},
            );
          },
        ),
      ],
    );
  }

  Widget boutique(List<BoutiqueCollection>? boutiqueCollection) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(left: 12, top: 15, bottom: 10),
        child: Align(alignment: Alignment.centerLeft, child: Text(Strings.boutiquecollection)),
      ),
      SizedBox(
        height: SizeUtils.verticleSize * 42,
        child: PageView.builder(
          itemCount: boutiqueCollection!.length,
          controller: _pageController,
          itemBuilder: (context, i) {
            return SizedBox(
              width: double.infinity,
              child: CachedNetworkImage(
                imageUrl: boutiqueCollection[i].bannerImage.toString(),
                placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                width: double.infinity,
                fit: BoxFit.fill,
              ),
            );
          },
          /* onPageChanged: (index) {
            _pageController.animateToPage(
              index,
              duration: _kDuration,
              curve: _kCurve,
            );

          },*/
        ),
      ),
      const SizedBox(
        height: 6,
      ),
      Container(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: DotsIndicator(
            controller: _pageController,
            itemCount: boutiqueCollection.length,
            onPageSelected: (int page) {
              _pageController.animateToPage(
                page,
                duration: _kDuration,
                curve: _kCurve,
              );
            },
          ),
        ),
      ),
      // indicatorwidget(boutiqueCollection.length,0)
    ]);
  }



  Widget imageslider(String imgPath) {
    return SizedBox(
        height: 200,
        width: double.infinity,
        child: CachedNetworkImage(
          imageUrl: imgPath,
          placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) => const Icon(Icons.error),
          width: double.infinity,
          fit: BoxFit.fill,
        ));
  }

  Widget _bottomMenu() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12, top: 17, bottom: 10),
          child: Align(alignment: Alignment.centerLeft, child: Text(Strings.rangeofpattern.toString())),
        ),
        BlocBuilder<HomeScreenBottomCubit, HomeScreenState>(builder: (context, state) {
          if (state is OnSuccessBottomMenu) {
            return Column(
              children: [
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.only(right: 12),
                      scrollDirection: Axis.horizontal,
                      itemCount: state.bottomDataModel.rangeOfPattern!.length,
                      itemBuilder: (context, index) {
                        RangeOfPattern rangep = state.bottomDataModel.rangeOfPattern![index];

                        return Container(
                          margin: const EdgeInsets.only(left: 14, bottom: 10),
                          width: 100,
                          height: 100,
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: CachedNetworkImage(
                                  imageUrl: rangep.image.toString(),
                                  placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                                  errorWidget: (context, url, error) => const Center(child: Icon(Icons.error)),
                                  height: double.infinity,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                bottom: 5,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20, right: 20),
                                  child: Text(
                                    rangep.name.toString(),
                                    maxLines: 4,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(color: AppColor.white, fontSize: 10, fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12, top: 17, bottom: 10),
                  child: Align(alignment: Alignment.centerLeft, child: Text(Strings.designoccasion)),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 12),
                  height: SizeUtils.verticleSize * 26,
                  child: ListView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.only(right: 12),
                      scrollDirection: Axis.horizontal,
                      itemCount: state.bottomDataModel.designOccasion!.length,
                      itemBuilder: (context, index) {
                        DesignOccasion designo = state.bottomDataModel.designOccasion![index];

                        return Container(
                          margin: const EdgeInsets.only(left: 10, bottom: 10),
                          width: SizeUtils.horizontalSize * 35,
                          color: AppColor.white,
                          child: Stack(
                            children: [
                              Container(
                                width: double.infinity,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(designo.image.toString()),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  color: AppColor.transparent,
                                  width: double.infinity,
                                  height: SizeUtils.verticleSize * 6.5,

                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            designo.subName.toString(),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                color: AppColor.black, fontSize: 12, fontWeight: FontWeight.w300),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            Strings.collection,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                color: AppColor.black, fontSize: 11, fontWeight: FontWeight.w300),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        designo.cta.toString(),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style:
                                            TextStyle(color: AppColor.black, fontSize: 9, fontWeight: FontWeight.w300),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                ),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        })
      ],
    );
  }
}
