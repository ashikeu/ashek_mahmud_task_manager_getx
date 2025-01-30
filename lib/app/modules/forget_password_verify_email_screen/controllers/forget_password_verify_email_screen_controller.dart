import 'package:ashek_task_manager_getx/app/modules/sign_in_screen/controllers/auth_controller.dart';
import 'package:ashek_task_manager_getx/app/services/network_caller.dart';
import 'package:ashek_task_manager_getx/app/utils/urls.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordVerifyEmailScreenController extends GetxController {
  final TextEditingController emailTEController = TextEditingController();

  final isLoading = false.obs;
  @override
  void onClose() {
    emailTEController.dispose();
    super.onClose();
  }

  Future<bool> verifyEmail() async {
    bool isSuccess=false;
    isLoading.value = true; 
    final NetworkResponse response =await NetworkCaller.getRequest(url: Urls.recoverVerifyEmailUrl(AuthController.userEmail!));    
    if (response.isSuccess) {
      Get.snackbar("Successful", 'OTP is sent to your email, Please check.');
      isSuccess= true;
    } else {
      Get.snackbar("Error", response.errorMessage);
    }
    isLoading.value = true; 
    return isSuccess;
  }
}
