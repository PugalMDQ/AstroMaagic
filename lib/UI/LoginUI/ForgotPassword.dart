import 'package:astromaagic/Routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Components/forms.dart';
import '../../Components/theme.dart';
import '../../Controller/LoginController/ForgotPasswordController.dart';

class ForgotPassword extends GetView<ForgotPasswordController> {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    ForgotPasswordController controller = Get.put(ForgotPasswordController());
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/splash.png",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 10),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Get.offNamed(AppRoutes.login.toName);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                      size: 20,
                    ))
              ],
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  Card(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      width: MediaQuery.of(context).size.width * 0.85,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: AppTheme.white,
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: 2, // spread radius
                              blurRadius: 20, // blur radius
                              offset: Offset(0, 3), // shadow color
                            )
                          ]),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Forgot Password",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                "Phone",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: AppTheme.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppTheme.containerBackground),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    borderSide: BorderSide(
                                        color: AppTheme.containerBackground),
                                  ),
                                  hintText: 'Phone',
                                  hintStyle: const TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400),
                                  contentPadding: const EdgeInsets.all(6),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppTheme.containerBackground),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                style: TextStyle(
                                    decoration: TextDecoration.none,
                                    decorationThickness: 0,
                                    color: AppTheme.textColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                "Password",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Obx(
                                () => Container(
                                  decoration: BoxDecoration(
                                      color: AppTheme.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5))),
                                  child: TextFormField(
                                    obscureText: controller.newPass.value,
                                    decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color:
                                                AppTheme.containerBackground),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)),
                                        borderSide: BorderSide(
                                            color:
                                                AppTheme.containerBackground),
                                      ),
                                      hintText: 'Password',
                                      hintStyle: const TextStyle(
                                          fontSize: 12.0,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400),
                                      suffixIcon: InkWell(
                                        onTap: () {
                                          controller.newPass.value =
                                              !controller.newPass.value;
                                        },
                                        child: Icon(controller.newPass.value
                                            ? Icons.visibility_off
                                            : Icons.visibility),
                                      ),
                                      contentPadding: const EdgeInsets.all(6),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color:
                                                AppTheme.containerBackground),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                    style: TextStyle(
                                        decoration: TextDecoration.none,
                                        decorationThickness: 0,
                                        color: AppTheme.textColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ),
                              )),
                          SizedBox(
                            height: 50,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Button(
                                    widthFactor: 0.78,
                                    heightFactor: 0.06,
                                    onPressed: () {
                                      Get.offNamed(AppRoutes.otp.toName);
                                    },
                                    child: Text("CHANGE",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                        ))),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
