import 'package:get/get.dart';
import 'package:lahakni_web/screens/user_screen/controller/user_controller.dart';

import '../screens/auth/controller/auth_controller.dart';
import '../screens/dashboard_screen/controller/dashboard_controller.dart';

class ScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => DashboardController());
    Get.lazyPut(() => UserController());
  }
}
