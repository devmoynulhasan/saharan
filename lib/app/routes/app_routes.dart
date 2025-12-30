

import 'package:get/get.dart';
import 'package:saharan/app/modules/authentication/bindings/sin_in_binding.dart';
import 'package:saharan/app/modules/authentication/screen/sin_in_screen.dart';
import 'package:saharan/app/modules/splash/screen/splash_screen.dart';

final List<GetPage> routes = [
  GetPage(name: AppRoutes.SPLASHSCREEN, page: () => const SplashScreen()),
  GetPage(name: AppRoutes.SININSCREEN, page: () => SinInScreen(), binding: SignInBinding(),),
 // GetPage(name: AppRoutes.SIGNUP, page: () => SignUpScreen(), binding: SignInBinding(),),
  //GetPage(name: AppRoutes.EMAIL_VERIFICATION, page: () => const EmailVerificationScreen(),),

];


class AppRoutes {
  AppRoutes._();
  static const String SPLASHSCREEN = "/";
  static const String SININSCREEN = "/LogInScreen";
  static const String SIGNUP = "/signup";
  static const String EMAIL_VERIFICATION = "/email-verification";

}