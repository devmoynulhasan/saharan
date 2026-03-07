
import 'package:flutter_dotenv/flutter_dotenv.dart';

class EndPoint {
  static late final String MAP_KEY;
  static late final String BASE_URL;
  static late final String SOCKET_URL;

  static void init() {
    MAP_KEY = dotenv.env['MAP_KEY'] ?? '';
    // BASE_URL = dotenv.env['BASE_URL'] ?? '';
    BASE_URL = dotenv.env['LOCAL_BASE_URL'] ?? '';
    SOCKET_URL = dotenv.env['SOCKET_URL'] ?? '';
  }


  /// authentication url
  static String get createUserURL => '$BASE_URL/api/v1/auth/create-account';
  static String get userLoginURL => '$BASE_URL/api/v1/auth/login';

  /// otp verify
  static String get signUpVerify => '$BASE_URL/api/v1/auth/verify-otp';
  static String get verifyOtpForForgotPasswordURL => '$BASE_URL/api/v1/auth/verify-otp';
  static String get resendOtpURL => '$BASE_URL/api/v1/auth/send-otp';

  /// sinUp ConformPassword
  static String get sinUpConformPassword => '$BASE_URL/api/v1/auth/confirm-signup';
  static String get singUpProfile => '$BASE_URL/api/v1/auth/update-profile';


  static String getSingleUser({required String userId}) => '$BASE_URL/user/single/$userId';
}
