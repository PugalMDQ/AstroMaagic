import 'package:astromaagic/Routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../../Components/OTPInput.dart';
import '../../Components/forms.dart';
import '../../Components/theme.dart';
import '../../Controller/LoginController/RegisterScreenController.dart';

class RegisterScreen extends GetView<RegisterScreenController> {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    RegisterScreenController controller = Get.put(RegisterScreenController());
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/backgroundImage.png",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              children: [
                TextInput(
                  // controller: controller.gstNumberController,
                  label: '',
                  onPressed: () {},
                  onTextChange: (text) {},
                  textInputType: TextInputType.text,
                  textColor: Color(0xCC252525),
                  hintText: 'Full name',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
