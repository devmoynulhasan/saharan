

import 'package:get/get.dart';
import 'package:saharan/app/modules/authentication/bindings/sign_up_binding.dart';
import 'package:saharan/app/modules/authentication/bindings/sin_in_binding.dart';
import 'package:saharan/app/modules/authentication/screen/sign_up_screen.dart';
import 'package:saharan/app/modules/authentication/screen/sin_in_screen.dart';
import 'package:saharan/app/modules/home/binding/account/account_change_password_bindings.dart';
import 'package:saharan/app/modules/home/binding/matches/matches_binding.dart';
import 'package:saharan/app/modules/home/view/account/account_setting_change_password.dart' hide ChangePasswordBinding;
import 'package:saharan/app/modules/home/view/matches/matches_live.dart';
import 'package:saharan/app/modules/splash/screen/splash_screen.dart';

final List<GetPage> routes = [
  GetPage(name: AppRoutes.SPLASHSCREEN, page: () => const SplashScreen()),
  GetPage(name: AppRoutes.SININSCREEN, page: () => SinInScreen(), binding: SignInBinding(),),
  GetPage(name: AppRoutes.SIGNUP, page: () => SignUpScreen(), binding: SignUpBinding(),),
  GetPage(name: AppRoutes.ACCOUNTSETTINGCHANGEPASSWORDSCREEN, page: () => AccountSettingChangePasswordScreen(), binding: ChangePasswordBinding(),),
  GetPage(name: AppRoutes.MATCHLIVE, page: () => const MatchesLive(),binding: MatchesBinding(),),
  //GetPage(name: AppRoutes.EMAIL_VERIFICATION, page: () => const EmailVerificationScreen(),),

];


class AppRoutes {
  AppRoutes._();
  static const String SPLASHSCREEN = "/";
  static const String SININSCREEN = "/LogInScreen";
  static const String SIGNUP = "/signup";
  static const String ACCOUNTSETTINGCHANGEPASSWORDSCREEN = "/AccountSettingChangePasswordScreen";
  static const String MATCHLIVE = "/matches-live";

}