enum AppRoutes {
  root,
  login,
  register,
  otp,
  forgotPassword,
  homeScreen,
  choosePaymentScreen,
  successfullyPaidScreen,
  vastuConsulting,
 vastuConsultingPriceSlot,
  generalPredictionScreenOne,
  vastuConsultingPaymentScreen, generalPredictionVoiceMessage, countryScreen,
}

extension AppRouteExtension on AppRoutes {
  static const appRoutes = {
    AppRoutes.root: "/",
    AppRoutes.login: "/LoginScreen",
    AppRoutes.register: "/RegisterScreen",
    AppRoutes.otp: "/OTPScreen",
    AppRoutes.forgotPassword: "/ForgotPassword",
    AppRoutes.homeScreen: "/HomeScreen",
    AppRoutes.countryScreen: "/CountryScreen",
    AppRoutes.choosePaymentScreen: "/ChoosePaymentScreen",
    AppRoutes.successfullyPaidScreen: "/SuccessfullyPaidScreen",
    AppRoutes.vastuConsulting: "/VastuConsulting",
    AppRoutes.generalPredictionScreenOne: "/GeneralPredictionScreenOne",
    AppRoutes.vastuConsultingPriceSlot: "/vastuConsultingPriceSlot",
    AppRoutes.vastuConsultingPaymentScreen: "/VastuConsultingPaymentScreen",
    AppRoutes.generalPredictionVoiceMessage: "/GeneralPredictionVoiceMessage",
  };

  String get toName => appRoutes[this]!;
}

enum ApiRoutes {
  forgot,
}

extension ApiRouteExtension on ApiRoutes {
  static const apiRoutes = {
    ApiRoutes.forgot: "",
  };

  String get toName => apiRoutes[this]!;
}
