

import 'package:get/get.dart';
import 'package:saharan/app/modules/authentication/bindings/forgot_conform_password_binding.dart';
import 'package:saharan/app/modules/authentication/bindings/forgot_varify_binding.dart';
import 'package:saharan/app/modules/authentication/bindings/sign_up_binding.dart';
import 'package:saharan/app/modules/authentication/bindings/sin_in_binding.dart';
import 'package:saharan/app/modules/authentication/bindings/sin_up_profile_photo_binding.dart';
import 'package:saharan/app/modules/authentication/screen/forgot_conform_password.dart';
import 'package:saharan/app/modules/authentication/screen/forgot_verify_account.dart';
import 'package:saharan/app/modules/authentication/screen/sign_up_profile_photo.dart';
import 'package:saharan/app/modules/authentication/screen/sign_up_screen.dart';
import 'package:saharan/app/modules/authentication/screen/sin_in_screen.dart';
import 'package:saharan/app/modules/home/binding/account/account_change_password_bindings.dart';
import 'package:saharan/app/modules/home/binding/matches/matches_binding.dart';
import 'package:saharan/app/modules/home/view/account/account_setting_change_password.dart' hide ChangePasswordBinding;
import 'package:saharan/app/modules/home/view/matches/matches_live.dart';
import 'package:saharan/app/modules/splash/binding/splash_binding.dart';
import 'package:saharan/app/modules/splash/screen/splash_screen.dart';

import '../modules/authentication/bindings/forgot_password_binding.dart';
import '../modules/authentication/bindings/sin_up_confrom_password_binding.dart';
import '../modules/authentication/bindings/sin_up_otp_varify_binding.dart';
import '../modules/authentication/bindings/sin_up_profile_binding.dart';
import '../modules/authentication/screen/forgot_password.dart';
import '../modules/authentication/screen/sign_up_profile.dart';
import '../modules/authentication/screen/sign_up_varify_otp.dart';
import '../modules/authentication/screen/sin_up_conform_password.dart';
import '../modules/home/view/home_screen.dart';

final List<GetPage> routes = [
  //Authentication
  GetPage(name: AppRoutes.SPLASHSCREEN,page: () => const SplashScreen(), binding: SplashBinding(),),
  GetPage(name: AppRoutes.SININSCREEN, page: () => SinInScreen(), binding: SignInBinding(),),
  GetPage(name: AppRoutes.SIGNUP, page: () => SignUpScreen(), binding: SignUpBinding(),),
  //GetPage(name: AppRoutes.SINUPOTPVARIFY, page: () => SignUpVarifyOtp(email: '',), binding: SinUpOtpVarifyBinding(),),
  //GetPage(name: AppRoutes.SINUPCONFORMPASSWORD, page: () => SinUpConformPassword(), binding: SinUpConformPasswordBinding(),),
 // GetPage(name: AppRoutes.SIUPPROFILE, page: () => SignUpProfile(), binding: SinUpProfileBinding(),),
 // GetPage(name: AppRoutes.SINUPPROFILEPHOTO, page: () => SignUpProfilePhoto(), binding: SinUpProfilePhotoBinding(),),
  GetPage(name: AppRoutes.FORGOTPASSWORD, page: () => ForgotPassword(), binding: ForgotPasswordBinding(),),
  //GetPage(name: AppRoutes.FORGOTVARIFYACCOUNT, page: () => ForgotVerifyAccount(email: '',), binding: ForgotVarifyBinging(),),
  //GetPage(name: AppRoutes.FORGOTCONFORMPASSWORD, page: () => ForgotConformPassword(), binding: ForgotConformPasswordBinding(),),

  GetPage(name: '/home', page: () => HomeScreen()),

  GetPage(name: AppRoutes.ACCOUNTSETTINGCHANGEPASSWORDSCREEN, page: () => AccountSettingChangePasswordScreen(), binding: ChangePasswordBinding(),),
  GetPage(name: AppRoutes.MATCHLIVE, page: () => const MatchesLive(),binding: MatchesBinding(),),
  GetPage(name: AppRoutes.MATCHLIVE, page: () => const MatchesLive(),binding: MatchesBinding(),),


  //GetPage(name: AppRoutes.EMAIL_VERIFICATION, page: () => const EmailVerificationScreen(),),

];


class AppRoutes {
  AppRoutes._();

  //Authentication

  static const String SPLASHSCREEN = "/";
  static const String SININSCREEN = "/LogInScreen";
  static const String SIGNUP = "/signup";
  static const String SINUPOTPVARIFY = "/SignUpVarifyOtp";
  static const String SINUPCONFORMPASSWORD = "/SinUpConformPassword";
  static const String SIUPPROFILE = "/SignUpProfile";
  static const String SINUPPROFILEPHOTO = "/SignUpProfilePhoto";
  static const String FORGOTPASSWORD = "/ForgotPassword";
  static const String FORGOTVARIFYACCOUNT = "/ForgotPassword";
  static const String FORGOTCONFORMPASSWORD = "/ForgotConformPassword";



  static const String ACCOUNTSETTINGCHANGEPASSWORDSCREEN = "/change-password";
  static const String MATCHLIVE = "/matches-live";

}
