import 'package:get/get.dart';

import '../controllers/forget_password_verify_email_screen_controller.dart';

class ForgetPasswordVerifyEmailScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgetPasswordVerifyEmailScreenController>(
      () => ForgetPasswordVerifyEmailScreenController(),
    );
  }
}
