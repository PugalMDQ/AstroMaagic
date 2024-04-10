import 'package:astromaagic/Binding/HomeBinding/HomeScreenBinding.dart';
import 'package:astromaagic/Binding/LoginBinding/ForgotPasswordBinding.dart';
import 'package:astromaagic/Binding/LoginBinding/OTPScreenBinding.dart';
import 'package:astromaagic/Binding/LoginBinding/RegisterScreenBinding.dart';
import 'package:astromaagic/Binding/VastuConsultingBinding/VastuConsultingBinding.dart';
import 'package:astromaagic/UI/GeneralPredictions/GeneralPredictionScreenOne.dart';
import 'package:astromaagic/UI/HomeScreen/HomeScreen.dart';
import 'package:astromaagic/UI/LoginUI/ForgotPassword.dart';
import 'package:astromaagic/UI/LoginUI/OTPScreen.dart';
import 'package:astromaagic/UI/LoginUI/RegisterScreen.dart';
import 'package:astromaagic/UI/VastuConsulting/VastuConsulting.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../Binding/GeneralPredictionsBinding/ChoosePaymentScreenBinding.dart';
import '../Binding/GeneralPredictionsBinding/GeneralPredictionsScreenOneBinding.dart';
import '../Binding/GeneralPredictionsBinding/SuccessfullyPaidScreenBinding.dart';
import '../Binding/LoginBinding/LoginBinding.dart';
import '../Binding/SplashBinding/SplashScreenBinding.dart';
import '../UI/GeneralPredictions/ChoosePaymentScreen.dart';
import '../UI/GeneralPredictions/SuccessfullyPaidScreen.dart';
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
    GetPage(
        name: AppRoutes.homeScreen.toName,
        page: () => const HomeScreen(),
        binding: HomeScreenBinding()),
    GetPage(
        name: AppRoutes.choosePaymentScreen.toName,
        page: () => const ChoosePaymentScreen(),
        binding: ChoosePaymentScreenBinding()),
    GetPage(
        name: AppRoutes.successfullyPaidScreen.toName,
        page: () => const SuccessfullyPaidScreen(),
        binding: SuccessfullyPaidScreenBinding()),
    GetPage(
        name: AppRoutes.vastuConsulting.toName,
        page: () => const VastuConsulting(),
        binding: VastuConsultingBinding()),
    GetPage(
        name: AppRoutes.generalPredictionScreenOne.toName,
        page: () => GeneralPredictionScreenOne(),
        binding: GeneralPredictionScreenOneBinding()),
  ];
}
