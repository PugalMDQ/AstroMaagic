import 'package:astromaagic/Components/theme.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../Components/HorizontalScrollView.dart';
import '../../Components/forms.dart';
import '../../Controller/HomeController/HomeScreenController.dart';

class HomeScreen extends GetView<HomeScreenController> {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    HomeScreenController controller = Get.put(HomeScreenController());
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/BackGround.png",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 0, left: 10),
                        child: Container(
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  icon: const Icon(
                                    Icons.menu,
                                    color: Colors.white,
                                    size: 20,
                                  )),
                              Image.asset(
                                "assets/images/logo.png",
                                width: 20,
                                height: 45,
                                fit: BoxFit.contain,
                              ),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Text(
                                  'Jyotish',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: FloatingActionButton(
                                  elevation: 0,
                                  backgroundColor: Colors.transparent,
                                  onPressed: () {},
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    child: Icon(
                                      Icons.notifications_active,
                                      color: Colors.white,
                                    ),
                                    decoration: BoxDecoration(
                                        color: AppTheme.screenColor,
                                        borderRadius:
                                            BorderRadius.circular(22.5)),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5)),
                            width: MediaQuery.of(context).size.width * 0.88,
                            // height: MediaQuery.of(context).size.height * 0.,
                            child: TextField(
                              onChanged: (value) {
                                // controller.isSearch.value = true;
                                // controller.SearchProductApi();
                              },
                              // controller: controller.searchController,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 8),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  hintText: 'Search',
                                  hintStyle: TextStyle(
                                    fontSize:
                                        12, // Choose the desired alignment
                                  ),
                                  prefixIcon: Icon(
                                    Icons.search,
                                    size: 18,
                                    color: Colors.black,
                                  )),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 22),
                        child: Container(
                          child: Row(
                            children: [
                              const Text(
                                'Categeories',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400),
                              ),
                              Spacer(),
                              GestureDetector(
                                onTap: () {},
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Container(
                                    color: AppTheme.screenColor,
                                    child: const Row(
                                      children: [
                                        Text(
                                          'See All',
                                          style: TextStyle(
                                              color: AppTheme.secondaryColor),
                                        ),
                                        Icon(
                                          Icons.keyboard_double_arrow_right,
                                          color: AppTheme.secondaryColor,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      HorizontalScrollView(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.13,
                            child: ListView.builder(
                              itemCount: 10,
                              scrollDirection: Axis.horizontal,
                              // Set horizontal scrolling
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return categories(context);
                              },
                            ),
                          )
                        ],
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        height: height * 0.25,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)),
                        child: CarouselSlider(
                          items: controller.sliderImage
                              .map((image) => Image.asset(image))
                              .toList(),
                          carouselController: controller.controllerOne,
                          options: CarouselOptions(
                              height: 400,
                              autoPlay: true,
                              autoPlayInterval: Duration(seconds: 3),
                              autoPlayAnimationDuration:
                                  Duration(milliseconds: 800),
                              autoPlayCurve: Curves.fastOutSlowIn,
                              onPageChanged: (index, _) =>
                                  controller.updatePageIndicator(index)),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Obx(
                        () => DotsIndicator(
                          dotsCount: controller.sliderImage.length,
                          position: controller.currentIndex.value,
                          decorator: DotsDecorator(
                            color: Colors.white,
                            activeColor: AppTheme.primaryColor,
                            size: const Size.square(9.0),
                            activeSize: const Size(18.0, 9.0),
                            activeShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 22),
                        child: Container(
                          child: Row(
                            children: [
                              const Text(
                                'Astrologers',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400),
                              ),
                              Spacer(),
                              GestureDetector(
                                onTap: () {},
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Container(
                                    color: AppTheme.screenColor,
                                    child: const Row(
                                      children: [
                                        Text(
                                          'See All',
                                          style: TextStyle(
                                              color: AppTheme.secondaryColor),
                                        ),
                                        Icon(
                                          Icons.keyboard_double_arrow_right,
                                          color: AppTheme.secondaryColor,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.2,
                        child: GridView.builder(
                          physics: AlwaysScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            mainAxisSpacing: 1,
                            childAspectRatio: 1.25,
                            // childAspectRatio: 0.85,
                          ),
                          itemCount: 5,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.2,
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: AppTheme.grey,
                                                spreadRadius: 0,
                                                blurRadius: 2)
                                          ]),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            height: 60,
                                            width: 60,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: AppTheme.labelColor),
                                                color: AppTheme.white,
                                                borderRadius:
                                                    BorderRadius.circular(30)),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              child: Image.asset(
                                                "assets/images/logo.png",
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            'INIYAVAN',
                                            style: TextStyle(
                                                color: AppTheme.appBlack,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Center(
                                            child: Button(
                                                widthFactor: 0.2,
                                                heightFactor: 0.04,
                                                onPressed: () {},
                                                child: const Text("Chat",
                                                    style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ))),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 22),
                        child: Container(
                          child: Row(
                            children: [
                              const Text(
                                'Astrologers',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400),
                              ),
                              Spacer(),
                              GestureDetector(
                                onTap: () {},
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Container(
                                    color: AppTheme.screenColor,
                                    child: const Row(
                                      children: [
                                        Text(
                                          'See All',
                                          style: TextStyle(
                                              color: AppTheme.secondaryColor),
                                        ),
                                        Icon(
                                          Icons.keyboard_double_arrow_right,
                                          color: AppTheme.secondaryColor,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height,
                        child: GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 1,
                            childAspectRatio: 1.25,
                          ),
                          itemCount: 10,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                Container(
                                  height: MediaQuery.of(context).size.height *
                                      0.15, // Increased height here
                                  width:
                                      MediaQuery.of(context).size.width * 0.35,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: AppTheme.grey,
                                        spreadRadius: 0,
                                        blurRadius: 2,
                                      )
                                    ],
                                  ),

                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/images/logo.png",
                                        height: 40,
                                      ),
                                      const Text(
                                        'Vastu Shastra',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget categories(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            SizedBox(
              width: 20,
            ),
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  color: AppTheme.white,
                  borderRadius: BorderRadius.circular(30)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  "assets/images/logo.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        const Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Text(
              'Aries',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
            )
          ],
        )
      ],
    );
  }
}
