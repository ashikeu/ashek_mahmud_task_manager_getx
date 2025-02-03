import 'package:ashek_task_manager_getx/app/modules/sign_in_screen/controllers/auth_controller.dart';
import 'package:ashek_task_manager_getx/app/services/network_caller.dart';
import 'package:ashek_task_manager_getx/app/utils/urls.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordVerifyOtpScreenController extends GetxController {
  final TextEditingController otpTEController = TextEditingController();
  final isLoading = false.obs;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  @override
  void onClose() {
    otpTEController.dispose();
    super.onClose();
  }

  Future<bool> verifyOTP() async {
    bool isSuccess = false;
    isLoading.value = true;
    final NetworkResponse response = await NetworkCaller.getRequest(
        url: Urls.recoverVerifyOTPUrl(
            AuthController.userEmail!, otpTEController.text.trim()));

    if (response.isSuccess) {
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    isLoading.value = false;
    return isSuccess;
  }
}
