import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';

import '../../Components/HomeListDetails.dart';

class HomeScreenController extends GetxController {
  final CarouselController controllerOne = CarouselController();
  RxInt currentIndex = RxInt(0);
  RxInt current = RxInt(0);

  void updatePageIndicator(index) {
    currentIndex.value = index;
  }

  final List<HomeListDetails> values = [
    HomeListDetails(
      name: 'General Predictions'.tr,
    ),
    HomeListDetails(
      name: 'Vastu Consulting'.tr,
    ),
  ];

  @override
  void onInit() {
    super.onInit();
  }

  List<String> sliderImage = [
    "assets/images/logo.png",
    "assets/images/BackGround.png",
  ];
}
