import 'package:ashek_task_manager_getx/app/modules/sign_in_screen/controllers/auth_controller.dart';
import 'package:ashek_task_manager_getx/app/services/network_caller.dart';
import 'package:ashek_task_manager_getx/app/utils/urls.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordVerifyOtpScreenController extends GetxController {
  final TextEditingController otpTEController = TextEditingController();
  final isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    otpTEController.dispose();
    super.onClose();
  }

  Future<bool> verifyOTP() async {
    bool isSuccess=false;
    isLoading.value = true;   
    final NetworkResponse response =await NetworkCaller.getRequest(url: Urls.recoverVerifyOTPUrl(AuthController.userEmail!,otpTEController.text.trim()));
    
    if (response.isSuccess) {
      Get.snackbar("Success", 'OTP verified');
      isSuccess= true;
    } else {
      Get.snackbar("Error", response.errorMessage);

    }
    isLoading.value = false;
    return isSuccess;
  }
}
