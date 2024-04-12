import 'package:astromaagic/Routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Components/forms.dart';
import '../../Components/theme.dart';
import '../../Controller/GeneralPredictionsController/GeneralPredictionScreenThreeController.dart';
import '../../Controller/VastuConsulting/VastuConsultingPriceSlotController.dart';

class VastuConsultingPriceSlot
    extends GetView<VastuConsultingPriceSlotController> {
  const VastuConsultingPriceSlot({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 55,
        backgroundColor: AppTheme.screenBackground,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.keyboard_arrow_left,
            color: Colors.white,
            size: 30,
          ),
        ),
        title: Text(
          'CHOOSE YOUR PRICE SLOT'.tr,
          maxLines: 2,
          style: TextStyle(
              overflow: TextOverflow.ellipsis,
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[],
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/images/backgroundImage.png",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 30, top: 20),
              width: width,
              child: Text(
                'Vastu Consulting'.tr,
                maxLines: 1,
                style: GoogleFonts.lato(
                  color: AppTheme.containerBackground,
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.only(
                left: 30,
              ),
              width: width,
              child: Text(
                "Horoscope".tr,
                maxLines: 1,
                style: GoogleFonts.lato(
                  color: AppTheme.containerBackground,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                width: width,
                height: height - 285,
                child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return slotList(context, index);
                  },
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Button(
                      widthFactor: 0.85,
                      heightFactor: 0.06,
                      onPressed: () {
                        Get.offNamed(
                            AppRoutes.vastuConsultingPaymentScreen.toName);
                      },
                      child: Text("Next".tr,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ))),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget slotList(BuildContext context, int index) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15, top: 10),
      width: width,
      height: height * 0.15,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: AppTheme.primaryColor, width: 2)),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 15, top: 15, bottom: 20),
            width: width * 0.43,
            height: height * 0.15,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'noOfQuestions'.tr,
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  'fees'.tr,
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          Container(
            width: width * 0.43,
            height: height * 0.15,
            child: Container(
              margin: EdgeInsets.all(20),
              width: width * 0.45,
              height: height * 0.15,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppTheme.primaryColor,
                  border: Border.all(color: AppTheme.primaryColor, width: 2)),
              child: Container(
                margin: EdgeInsets.only(left: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '2',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w800),
                    ),
                    Text(
                      '₹ 3000',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
