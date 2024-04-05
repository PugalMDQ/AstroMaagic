import 'package:get/get.dart';
import '../../Controller/LoginController/LoginScreenController.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginScreenController>(() => LoginScreenController());
  }
}
