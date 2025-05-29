import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:lahakni_web/screens/auth/send_otp_screen.dart';
import 'package:lahakni_web/screens/auth/set_new_pass.dart';
import 'package:lahakni_web/screens/auth/verify_otp_screen.dart';
import 'package:lahakni_web/screens/dashboard_screen/dashboard_screen.dart';
import 'package:lahakni_web/screens/user_screen/user_screen.dart';
import 'package:lahakni_web/utils/screen_bindings.dart';
import '../screens/auth/auth_screen.dart';
import '../screens/user_screen/user_detail_screen.dart';
import 'app_strings.dart';

class RouteGenerator {
  static List<GetPage> getPages() {
    return [
      GetPage(name: kAuthScreenRoute, page: () => AuthScreen(), binding: ScreenBindings(),),
      GetPage(name: kSendOtpScreenRoute, page: () => SendOtpScreen(), binding: ScreenBindings(),),
      GetPage(name: kVerifyOtpScreenRoute, page: () => VerifyOtpScreen(), binding: ScreenBindings(),),
      GetPage(name: kSetNewPassScreenRoute, page: () => SetNewPassScreen(), binding: ScreenBindings(),),
      GetPage(name: kDashboardScreenRoute, page: () => DashboardScreen(), binding: ScreenBindings(),),
      GetPage(name: kUserScreenRoute, page: () => UserScreen(), binding: ScreenBindings(),),
      GetPage(name: kUserDetailScreenRoute, page: () => UserDetailScreen(), binding: ScreenBindings(),),
    ];
  }
}

