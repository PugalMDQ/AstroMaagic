import 'package:astromaagic/Binding/CountrySelectionBinding/CountrySelectionBinding.dart';
import 'package:astromaagic/Binding/HomeBinding/HomeScreenBinding.dart';
import 'package:astromaagic/Binding/LoginBinding/ForgotPasswordBinding.dart';
import 'package:astromaagic/Binding/LoginBinding/OTPScreenBinding.dart';
import 'package:astromaagic/Binding/LoginBinding/RegisterScreenBinding.dart';
import 'package:astromaagic/Binding/VastuConsultingBinding/VastuConsultingBinding.dart';
import 'package:astromaagic/UI/CountrySelection/CountrySelectionScreen.dart';
import 'package:astromaagic/UI/GeneralPredictions/GeneralPredictionScreenOne.dart';
import 'package:astromaagic/UI/HomeScreen/HomeScreen.dart';
import 'package:astromaagic/UI/LoginUI/ForgotPassword.dart';
import 'package:astromaagic/UI/LoginUI/OTPScreen.dart';
import 'package:astromaagic/UI/LoginUI/RegisterScreen.dart';
import 'package:astromaagic/UI/VastuConsulting/ServiceHistory.dart';
import 'package:astromaagic/UI/VastuConsulting/VastuConsulting.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../Binding/CalenderViewBinding/CalendlyViewBinding.dart';
import '../Binding/CalenderViewBinding/TimeSelectionProcessSlotBinding.dart';
import '../Binding/GeneralPredictionsBinding/ChoosePaymentScreenBinding.dart';
import '../Binding/GeneralPredictionsBinding/GeneralPredictionVoiceMessageBinding.dart';
import '../Binding/GeneralPredictionsBinding/GeneralPredictionsScreenOneBinding.dart';
import '../Binding/GeneralPredictionsBinding/SuccessfullyPaidScreenBinding.dart';
import '../Binding/LoginBinding/LoginBinding.dart';
import '../Binding/LoginBinding/mobileNumberBinding.dart';
import '../Binding/SplashBinding/SplashScreenBinding.dart';
import '../Binding/VastuConsultingBinding/ServiceHistoryBinding.dart';
import '../Binding/VastuConsultingBinding/VastuConsultingPaymentScreenBinding.dart';
import '../Binding/VastuConsultingBinding/VastuConsultingPriceSlotBinding.dart';
import '../Controller/CalenderViewController/TimeSlotProcessController.dart';
import '../UI/CalenderView/CalendlyView.dart';
import '../UI/CalenderView/TimeSlotSelectionProcess.dart';
import '../UI/GeneralPredictions/ChoosePaymentScreen.dart';
import '../UI/GeneralPredictions/GeneralPredictionsVoiceMessageScreen.dart';
import '../UI/GeneralPredictions/SuccessfullyPaidScreen.dart';
import '../UI/LoginUI/LoginScreen.dart';
import '../UI/LoginUI/MobileNumberScreen.dart';
import '../UI/SplashScreen/SplashScreen.dart';
import '../UI/VastuConsulting/VastuConsultingPaymentScreen.dart';
import '../UI/VastuConsulting/VastuConsultingPriceSlot.dart';
import 'app_routes.dart';

class AppPages {
  static var list = [
    GetPage(
        name: AppRoutes.root.toName,
        page: () => const SplashScreen(),
        binding: SplashScreenBinding()),
    GetPage(
        name: AppRoutes.Login.toName,
        page: () => const LoginScreen(),
        binding: LoginBinding()),
    GetPage(
        name: AppRoutes.mobileNumberScreen.toName,
        page: () => const MobileNumberScreen(),
        binding: mobileNumberBinding()),
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
    GetPage(
        name: AppRoutes.vastuConsultingPriceSlot.toName,
        page: () => VastuConsultingPriceSlot(),
        binding: VastuConsultingPriceSlotBinding()),
    GetPage(
        name: AppRoutes.vastuConsultingPaymentScreen.toName,
        page: () => VastuConsultingPaymentScreen(),
        binding: VastuConsultingPaymentScreenBinding()),
    GetPage(
        name: AppRoutes.generalPredictionVoiceMessage.toName,
        page: () => GeneralPredictionVoiceMessageScreen(),
        binding: GeneralPredictionVoiceMessageBinding()),
    GetPage(
        name: AppRoutes.countryScreen.toName,
        page: () => CountrySelectionScreen(),
        binding: CountrySelectionBinding()),
    GetPage(
        name: AppRoutes.serviceHistory.toName,
        page: () => ServiceHistory(),
        binding: ServiceHistoryBinding()),
    GetPage(
        name: AppRoutes.calendlyView.toName,
        page: () => CalendlyView(),
        binding: CalendlyViewBinding()),
    GetPage(
        name: AppRoutes.timeSelectionProcessSlot.toName,
        page: () => TimeSelectionProcessSlot(),
        binding: TimeSelectionSlotBinding()),
  ];
}
