import 'package:get/get.dart';

import '../controllers/forget_password_verify_otp_screen_controller.dart';

class ForgetPasswordVerifyOtpScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgetPasswordVerifyOtpScreenController>(
      () => ForgetPasswordVerifyOtpScreenController(),
    );
  }
}
