import 'dart:math';

import 'package:astromaagic/ResponseModel/GetParticularServicesResponse.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import '../../Api_Connect/ApiConnect.dart';
import '../../Components/DateRangeExample.dart';
import '../../Components/forms.dart';
import '../../Components/theme.dart';
import '../../Provider/MenuDataProvider.dart';
import '../../ResponseModel/AvailableDateResponse.dart';
import '../../ResponseModel/GetRemediesResponse.dart';
import '../../ResponseModel/VastuPriceSlotResponse.dart';
import '../../Utils/AppPreference.dart';
import '../../Utils/app_utility.dart';

class CalendlyController extends GetxController {
  RxBool consultationVirtualMeeting = RxBool(false);
  RxBool personalizedConsultation = RxBool(false);
  late MenuDataProvider userDataProvider;
  ApiConnect _connect = Get.put(ApiConnect());
  RxBool isLoading = RxBool(false);
  RxBool shouldExecuteViewChangedCallback = RxBool(false);
  RxBool isTimeApiCalled = RxBool(true);
  GetParticularData? getParticularData;
  RxList<Days> days = RxList();
  DateTime? selectedDateTime;
  RxList<DateTime> availableDates = RxList();
  DateRangePickerViewChangedArgs? args;
  DateRangePickerController pickerController = DateRangePickerController();
  bool isCall = false;
  bool ableToCall = false;
  RxList<bool> remediesListOnClick = RxList();
  RxList<GetRemediesData> remediesData = RxList();
  late BuildContext context;
  RxList<VastuPriceSlotResponseData> vastuData = RxList();
  int? selectedIndex = 0;

  @override
  void onInit() {
    super.onInit();
    getAllEventSlot(DateTime.now(), getLastDateOfCurrentMonth());
  }

  DateTime getLastDateOfCurrentMonth() {
    // Get the current date
    DateTime currentDate = DateTime.now();

    // Get the next month
    int nextMonth = currentDate.month + 1;

    // If it's December, go to the next year
    int nextYear = currentDate.year;
    if (nextMonth > 12) {
      nextMonth = 1;
      nextYear++;
    }

    // Get the first day of the next month
    DateTime firstDayOfNextMonth = DateTime(nextYear, nextMonth, 1);

    // Subtract one day to get the last day of the current month
    DateTime lastDayOfCurrentMonth =
        firstDayOfNextMonth.subtract(Duration(days: 1));

    return lastDayOfCurrentMonth;
  }

  bool isDateSelectable(DateTime date) {
    // if (availableDates.contains(date)) {
    //   availableDates.indexOf(date);
    // }
    return availableDates.contains(date);
  }

  getParticularServices() async {
    Map<String, dynamic> payload = {
      'loginUserId': AppPreference().getLoginUserId.toString(),
      'serviceId':
          userDataProvider.getAllServicesData!.serviceId.toString() ?? ''
    };
    isLoading.value = true;
    AppUtility.loader(context);
    print("getParticularServicesPayload:$payload");
    var response = await _connect.getParticularServicesCall(payload);
    debugPrint("getParticularServicesResponse: ${response.toJson()}");
    Get.back();
    if (!response.error!) {
      getParticularData = response.data;
    } else {}
    isLoading.value = false;
  }

  getAllEventSlot(DateTime startDate, DateTime endDate) async {
    Map<String, dynamic> payload = {
      'range_start': formatDate(startDate, [yyyy, '-', mm, '-', "01"]),
      'range_end': formatDate(endDate, [yyyy, '-', mm, '-', dd]),
      'uuid': "4579b25c-7516-42ce-b0d4-70b4db1b7a80",
    };

    print("getParticularServicesPayload:$payload");
    isTimeApiCalled.value = true;
    var response = await _connect.getAllEventSlot(payload);

    days.clear();
    if (!response.error! &&
        response.eventSlot != null &&
        response.eventSlot!.days != null) {
      days.value = response.eventSlot!.days!;

      for (final day in days) {
        if (day.status == 'available') {
          availableDates.add(DateTime.parse(day.date ?? ""));
        }
      }
    } else {}
    isTimeApiCalled.value = false;
    pickerController.displayDate = startDate;
  }

  getRemedies() async {
    Map<String, dynamic> payload = {
      'loginUserId': AppPreference().getLoginUserId.toString(),
      'serviceId':
          userDataProvider.getAllServicesData!.serviceId.toString() ?? ''
    };
    isLoading.value = true;
    AppUtility.loader(context);
    print("getRemediesPayload:$payload");
    var response = await _connect.getRemediesServicesCall(payload);
    debugPrint("getRemediesPayloadResponse: ${response.toJson()}");
    Get.back();
    if (!response.error!) {
      remediesData.value = response.data!;
      for (int i = 0; i < response.data!.length; i++) {
        remediesListOnClick.add(false);
      }
    } else {}
    isLoading.value = false;
  }

  Future<void> vastuPriceSlot() async {
    Map<String, dynamic> payload = {
      'loginUserId': AppPreference().getLoginUserId.toString(),
      'remedyId': userDataProvider.getRemediesData!.remedyId.toString()
    };
    isLoading.value = true;
    print('VastuPriceSlotRequest$payload');
    var response = await _connect.vastuPriceSlot(payload);
    debugPrint("VastuPriceSlotResponse: ${response.toJson()}");
    if (!response.error!) {
      vastuData.value = response.data!;
      // for (int i = 0; i < response.data!.length; i++) {
      //   remedyChargesListOnClick.add(false);
      // }
    } else {}
    isLoading.value = false;
  }

  void showBottomSheetDate(
    BuildContext context,
  ) {
    DateTime focusDay = DateTime.now();
    DateTime? selectedDay = focusDay;
    // selectedDate.value = formatDate(selectedDay!, [yyyy, '-', mm, '-', dd]);
    // dateformat.value = formatDate(selectedDay, [dd, '.', M, '.', yyyy]);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Get.bottomSheet(SingleChildScrollView(
        child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
            child: Container(
                color: Colors.white,
                child: Column(children: [
                  Container(
                    height: 350,
                    child: DateRangeExample(
                        // controller: controller,
                        //  selectedDate: selectedDate,
                        //  dateformat: dateformat

                        ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AppButton2(
                        width: width * 0.45,
                        height: 40,
                        title: 'Cancel',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        onPressed: () {
                          Get.back();
                        },
                        color: Colors.white,
                        titleColor: AppTheme.bottomTabsLabelInActiveColor,
                        borderColor: AppTheme.cancelBorder,
                      ),
                      AppButton2(
                        width: width * 0.45,
                        height: 40,
                        title: 'Save ',
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        onPressed: () {
                          //  controller.text = dateformat.value;
                          Navigator.pop(context);
                          // _showbottomTimePicker(context, controller,
                          //     controller.value.text, dateformat, selectedDate);
                        },
                        titleColor: Colors.black,
                        color: AppTheme.primaryColor,
                        borderColor: AppTheme.primaryColor,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ])))));
  }
}
