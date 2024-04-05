import 'package:astromaagic/Binding/LoginBinding/ForgotPasswordBinding.dart';
import 'package:astromaagic/Binding/LoginBinding/OTPScreenBinding.dart';
import 'package:astromaagic/Binding/LoginBinding/RegisterScreenBinding.dart';
import 'package:astromaagic/UI/LoginUI/ForgotPassword.dart';
import 'package:astromaagic/UI/LoginUI/OTPScreen.dart';
import 'package:astromaagic/UI/LoginUI/RegisterScreen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../Binding/LoginBinding/LoginBinding.dart';
import '../Binding/SplashBinding/SplashScreenBinding.dart';
import '../UI/LoginUI/LoginScreen.dart';
import '../UI/SplashScreen/SplashScreen.dart';
import 'app_routes.dart';

class AppPages {
  static var list = [
    GetPage(
        name: AppRoutes.root.toName,
        page: () => const SplashScreen(),
        binding: SplashScreenBinding()),
    GetPage(
        name: AppRoutes.login.toName,
        page: () => const LoginScreen(),
        binding: LoginBinding()),
    GetPage(
        name: AppRoutes.register.toName,
        page: () => const RegisterScreen(),
        binding: RegisterScreenBinding()),
    GetPage(
        name: AppRoutes.otp.toName,
        page: () => const OTPScreen(),
        binding: OTPScreenBinding()),
    GetPage(
        name: AppRoutes.forgotPassword.toName,
        page: () => const ForgotPassword(),
        binding: ForgotPasswordBinding()),
  ];
}
