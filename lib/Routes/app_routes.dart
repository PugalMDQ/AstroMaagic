enum AppRoutes { root, login, register, otp, forgotPassword, homeScreen }

extension AppRouteExtension on AppRoutes {
  static const appRoutes = {
    AppRoutes.root: "/",
    AppRoutes.login: "/LoginScreen",
    AppRoutes.register: "/RegisterScreen",
    AppRoutes.otp: "/OTPScreen",
    AppRoutes.forgotPassword: "/ForgotPassword",
    AppRoutes.homeScreen: "/HomeScreen",
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
