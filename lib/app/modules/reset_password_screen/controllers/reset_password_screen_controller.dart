import 'package:ashek_task_manager_getx/app/modules/sign_in_screen/controllers/auth_controller.dart';
import 'package:ashek_task_manager_getx/app/services/network_caller.dart';
import 'package:ashek_task_manager_getx/app/utils/urls.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordScreenController extends GetxController {
  final TextEditingController newPasswordTEController =
      TextEditingController();
  final TextEditingController confirmPasswordTEController =
      TextEditingController();

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
      newPasswordTEController.dispose();
    confirmPasswordTEController.dispose();
    super.onClose();
  }

  Future<bool> resetPassword() async {
    bool isSuccess = false;
    isLoading.value = true;
    Map<String, dynamic> requestBody = {
      "email": AuthController.userEmail,
      "OTP": AuthController.userOTP,
      "password": newPasswordTEController.text
    };
    final NetworkResponse response = await NetworkCaller.postRequest(
        url: Urls.recoverResetPassUrl, body: requestBody);
    isLoading.value = false;
    if (response.isSuccess) {
      isSuccess = true;
      Get.snackbar("Success",'Password changed successfully.');
    } else {
      Get.snackbar(
          "Error", response.errorMessage);
    }
    return isSuccess;
  }

}
