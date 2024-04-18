import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Components/theme.dart';
import '../../Controller/VastuConsulting/ServiceHistoryController.dart';

class ServiceHistory extends GetView<ServiceHistoryController> {
  const ServiceHistory({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    ServiceHistoryController controller = Get.put(ServiceHistoryController());

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppTheme.App_color,
        leading: IconButton(
            icon: const ImageIcon(AssetImage(
              "assets/icons/back_ios.png",
            )),
            color: AppTheme.primaryColor,
            iconSize: 18,
            onPressed: () {
              Get.back();
            }),
        title: Text(
          'Service History',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        height: height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/images/backgroundImage.png",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Obx(
                () => controller.isLoading.value
                    ? const Center(child: CircularProgressIndicator())
                    : Container(
                        child: ListView.builder(
                          itemCount: controller.servicesData.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return servicesList(context, index);
                          },
                        ),
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget servicesList(BuildContext context, int index) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    ServiceHistoryController controller = Get.put(ServiceHistoryController());
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 15, right: 15, top: 10),
          width: width,
          height: height * 0.13,
          decoration: BoxDecoration(
              color: AppTheme.screenBackground,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: AppTheme.primaryColor, width: 2)),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 17),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      controller.servicesData[index]!.services.toString() ?? "",
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: AppTheme.primaryColor,
                          borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text(
                          'Pending',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 17),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      controller.servicesData[index]!.remedy.toString() ?? "",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 17),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Price: ',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 2),
                      child: Text(
                        '₹${controller.servicesData[index]!.fees.toString() ?? ""}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16,
                            color: AppTheme.primaryColor,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 17),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      controller.servicesData[index]!.createdDateTime
                              .toString() ??
                          "",
                      style: TextStyle(
                          fontSize: 12,
                          color: AppTheme.primaryColor,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}
