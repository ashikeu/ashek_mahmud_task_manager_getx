import 'dart:convert';

import 'package:ashek_task_manager_getx/app/models/user_model.dart';
import 'package:ashek_task_manager_getx/app/modules/sign_in_screen/controllers/auth_controller.dart';
import 'package:ashek_task_manager_getx/app/routes/app_pages.dart';
import 'package:ashek_task_manager_getx/app/services/network_caller.dart';
import 'package:ashek_task_manager_getx/app/utils/urls.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SignInScreenController extends GetxController {
  final TextEditingController emailTEController = TextEditingController();
  final TextEditingController passwordTEController = TextEditingController();
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }


  @override
  void onClose() {
    emailTEController.dispose();
    passwordTEController.dispose();
    super.onClose();
  }

  Future<void> login() async {
    isLoading.value = true;// Replace with your API URL

    try {
      Map<String, dynamic> requestBody = {
      "email": emailTEController.text.trim(),
      "password": passwordTEController.text,
    };
    final NetworkResponse response =
        await NetworkCaller.postRequest(url: Urls.loginUrl, body: requestBody);

      if (response.isSuccess) {
      String token = response.responseData!['token'];
      UserModel userModel = UserModel.fromJson(response.responseData!['data']);
      await AuthController.saveUserData(token, userModel);
      isLoading.value=false;
      Get.offAllNamed(Routes.HOME);
      // Navigator.pushReplacementNamed(context, MainBottomNavScreen.name);
    } else {
      // _signInProgress = false;
      // setState(() {});
      if (response.statusCode == 401) {
        Get.snackbar('Error', 'Email/Password is invalid! Try again.');
      } else {
        Get.snackbar('Error', response.errorMessage);
      }
    }
    } catch (e) {
      // Handle any exceptions (e.g., no internet connection)
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
